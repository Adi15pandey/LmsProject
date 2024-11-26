import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'notice_data_table.dart';  // Ensure this import is added

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
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  String _selectedNoticeType = 'All';
  // String _searchQuery = '';
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
            // TextFormField(
            //   decoration: InputDecoration(
            //     labelText: 'Search Query',
            //     border: OutlineInputBorder(),
            //   ),
            //   onChanged: (value) {
            //     setState(() {
            //       _searchQuery = value;
            //     });
            //   },
            // ),
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
            // Apply filter logic
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
