// Make sure to import the correct file
import 'package:flutter/material.dart';
import 'notice_data_source.dart';  // Correct import

class NoticeDataTable extends StatefulWidget {
  @override
  State<NoticeDataTable> createState() => _NoticeDataTableState();
}

class _NoticeDataTableState extends State<NoticeDataTable> {
  late NoticeDataSource _noticeDataSource;

  @override
  void initState() {
    super.initState();
    _noticeDataSource = NoticeDataSource(this.context);

    final DateTime startDate = DateTime(2024, 11, 20);
    final DateTime endDate = DateTime(2024, 11, 22);
    final String selectedNoticeType = 'All';
    final String searchQuery = '';

    // Fetch the data
    _noticeDataSource.fetchData(startDate, endDate, selectedNoticeType, searchQuery).then((_) {
      setState(() {});  // Rebuild UI once data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Notices')),
      body: _noticeDataSource.isLoading
          ? Center(child: CircularProgressIndicator())
          : _noticeDataSource.errorMessage.isNotEmpty
          ? Center(child: Text(_noticeDataSource.errorMessage))
          : SingleChildScrollView(
        child: PaginatedDataTable(
          columns: [
            DataColumn(label: Text('Sr No')),
            DataColumn(label: Text('Type')),
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('File Name')),
          ],
          source: _noticeDataSource,
          rowsPerPage: 10,
        ),
      ),
    );
  }
}

