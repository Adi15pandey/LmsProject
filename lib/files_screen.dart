import 'package:areness/Notice%20_type_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'notice_data_table.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// Ensure this import is added

class FilesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Files'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return FilterDialog();
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: NoticeDataTable(),  // Ensure this widget is used
    );
  }
}



class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  String _selectedNoticeType = 'All';
  List<NoticeType> _noticeTypes = [];

  Future<void> _selectDate(BuildContext context, DateTime initialDate, ValueChanged<DateTime> onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  Future<void> _fetchNoticeTypes() async {

    final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzE3NzcxOGM5YzFmM2YwZTllZjcwM2EiLCJyb2xlIjoib3BzIiwiaWF0IjoxNzMyNjE2NDEwLCJleHAiOjE3MzI3MDI4MTB9.4i88sZwMRjzVT62OnlHXcI30AL6bvvpUApSBktFAWJ0';
    final url = Uri.parse('https://lms.test.recqarz.com/api/noticeType/fetch?isActive=true');
    final response = await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      List<dynamic> data = responseData['data'];
      setState(() {
        _noticeTypes = data.map((e) => NoticeType.fromJson(e)).toList();
      });
    } else {
      throw Exception('Failed to load notice types');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            DatePickerField(
              label: 'Start Date',
              selectedDate: _startDate,
              onDateSelected: (date) {
                setState(() {
                  _startDate = date;
                });
              },
            ),
            SizedBox(height: 10),
            DatePickerField(
              label: 'End Date',
              selectedDate: _endDate,
              onDateSelected: (date) {
                setState(() {
                  _endDate = date;
                });
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedNoticeType,
              onChanged: (newValue) {
                setState(() {
                  _selectedNoticeType = newValue!;
                });
              },
              items: <String>['All', 'DLN', 'QLD', 'Execution', 'Conciliation']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Notice Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Apply the filter and fetch the data
            _fetchNoticeTypes();
            Navigator.of(context).pop();
          },
          child: Text('Apply'),
        ),
      ],
    );
  }
}


class DatePickerField extends StatelessWidget {
  final String label;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  DatePickerField({
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (picked != null && picked != selectedDate) {
          onDateSelected(picked);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today, size: 20, color: Colors.grey),
            SizedBox(width: 8),
            Text(
              DateFormat('yyyy-MM-dd').format(selectedDate),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
