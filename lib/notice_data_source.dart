// Ensure this file has NoticeDataSource class defined
import 'package:areness/filelistscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'notice_model.dart';
import 'dart:convert';  // For JSON decoding
import 'package:http/http.dart' as http;
// class Notice {
//   final String noticeTypeName;
//   final DateTime createdAt;
//   final String filename;
//
//   Notice({
//     required this.noticeTypeName,
//     required this.createdAt,
//     required this.filename,
//   });
//
//   // Parse the JSON response to a Notice object
//   factory Notice.fromJson(Map<String, dynamic> json) {
//     return Notice(
//       noticeTypeName: json['NoticeID']['filename'] ?? 'Unknown',  // Adjust this path if necessary
//       createdAt: DateTime.parse(json['NoticeID']['createdAt']),
//       filename: json['NoticeID']['filename'] ?? 'No filename',
//     );
//   }
// }
// For making API calls

class NoticeDataSource extends DataTableSource {
  final List<NoticeModel> notices = [];
  bool _isLoading = true;
  String _errorMessage = '';
  final BuildContext context;

  NoticeDataSource(this.context);

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchData(DateTime startDate, DateTime endDate, String selectedNoticeType, String searchQuery) async {
    final String apiUrl = 'https://lms.test.recqarz.com/api/notice/notices';

    final Map<String, String> params = {
      'startDate': '${startDate.toLocal()}'.split(' ')[0],
      'endDate': '${endDate.toLocal()}'.split(' ')[0],
      'page': '1',  // Example page number
      'limit': '10',  // Example limit
      'NoticeID': '66f38fbc1c527c801602fd38',
    };

    final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzE3NzcxOGM5YzFmM2YwZTllZjcwM2EiLCJyb2xlIjoib3BzIiwiaWF0IjoxNzMyNjE1NjQyLCJleHAiOjE3MzI3MDIwNDJ9.nABUYsWa2rJgfnLi7rfCiKLPILzShNqo9zRzXKnPQbA';  // Replace with your actual token

    try {

      final response = await http.get(
        Uri.parse(Uri.encodeFull(apiUrl + '?' + Uri(queryParameters: params).query)),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> notices = data['data'];

        final List<NoticeModel> noticeList = notices.map((notice) {
          return NoticeModel.fromJson(notice);
        }).toList();

        // Clear old data and add new data
        this.notices.clear();
        this.notices.addAll(noticeList);
        _isLoading = false;
        notifyListeners();
      } else {
        _errorMessage = 'Failed to load data';
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
      _isLoading = false;
      notifyListeners();  // Notify listeners in case of exception
    }
  }

  @override
  DataRow? getRow(int index) {
    if (index >= notices.length) return null;
    final notice = notices[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text(notice.noticeTypeName)),
        DataCell(Text(DateFormat('yyyy-MM-dd').format(notice.createdAt))),
        DataCell(
          Text(notice.filename, style: TextStyle(
    color: Colors.blue,  // Set the text color to blue
    decoration: TextDecoration.underline,)),
          onTap: () {
            // Handle tap event to navigate to FileListScreen
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FileListScreen(filename: notice.filename,),

              ),
            );
          },
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => notices.length;
  @override
  int get selectedRowCount => 0;
}

