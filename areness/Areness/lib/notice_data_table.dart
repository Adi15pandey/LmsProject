import 'package:flutter/material.dart';
import 'notice_data_source.dart';

class NoticeDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateTime startDate = DateTime(2024, 11, 20);
    final DateTime endDate = DateTime(2024, 11, 22);
    final String selectedNoticeType = 'All';
    final String searchQuery = '';

    final NoticeDataSource _noticeDataSource = NoticeDataSource(
      startDate: startDate,
      endDate: endDate,
      selectedNoticeType: selectedNoticeType,
      searchQuery: searchQuery,
      context: context,
    );

    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: Text('Notices'),
        columns: [
          DataColumn(label: Text('Sr No')),
          DataColumn(label: Text('Type')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('File')),
        ],
        source: _noticeDataSource,
        rowsPerPage: 10,
      ),
    );
  }
}
