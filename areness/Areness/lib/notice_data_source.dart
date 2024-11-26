import 'package:areness/filelistscreen.dart';
import 'package:flutter/material.dart';

class NoticeDataSource extends DataTableSource {
  final DateTime startDate;
  final DateTime endDate;
  final String selectedNoticeType;
  final String searchQuery;
  final BuildContext context;

  NoticeDataSource({
    required this.startDate,
    required this.endDate,
    required this.selectedNoticeType,
    required this.searchQuery,
    required this.context,
  });

  final List<Map<String, dynamic>> _allNotices = [
    {'srNo': 1, 'type': 'DLN', 'date': '2024-11-22', 'file': 'DLN_OLD (2000).Xls'},
    {'srNo': 2, 'type': 'QLD', 'date': '2024-11-22', 'file': 'DLN_OLD (2000).Xls'},
    {'srNo': 3, 'type': 'Execution', 'date': '2024-11-22', 'file': 'DLN_OLD (2000).Xls'},
    {'srNo': 4, 'type': 'Conciliation', 'date': '2024-11-22', 'file': 'DLN_OLD (2000).Xls'},
    {'srNo': 5, 'type': 'Conciliation', 'date': '2024-11-22', 'file': 'DLN_OLD (2000).Xls'},
    {'srNo': 6, 'type': 'QLD', 'date': '2024-11-22', 'file': 'DLN_OLD (2000).Xls'},
    {'srNo': 7, 'type': 'Execution', 'date': '2024-11-21', 'file': 'DLN_OLD (2000).Xls'},
    {'srNo': 8, 'type': 'QLD', 'date': '2024-11-21', 'file': 'DLN_OLD (2000).Xls'},
    {'srNo': 9, 'type': 'DLN', 'date': '2024-11-20', 'file': 'DLN_OLD (2000).Xls'},
    {'srNo': 10, 'type': 'Execution', 'date': '2024-11-20', 'file': 'DLN_OLD (2000).Xls'},
  ];

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _filteredNotices.length) return null;

    final notice = _filteredNotices[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${notice['srNo']}')),
        DataCell(Text('${notice['type']}')),
        DataCell(Text('${notice['date']}')),
        DataCell(
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> FileListScreen(),)//for switching the screen
              );
            },
            child: Text('${notice['file']}',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }

  @override
  int get rowCount => _filteredNotices.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  List<Map<String, dynamic>> get _filteredNotices {
    return _allNotices.where((notice) {
      final noticeDate = DateTime.parse(notice['date']);
      final withinDateRange = noticeDate.isAfter(startDate.subtract(Duration(days: 1))) && noticeDate.isBefore(endDate.add(Duration(days: 1)));
      final matchesType = selectedNoticeType == 'All' || notice['type'] == selectedNoticeType;
      final matchesSearchQuery = notice['file'].toLowerCase().contains(searchQuery.toLowerCase());
      return withinDateRange && matchesType && matchesSearchQuery;
    }).toList();
  }
}
