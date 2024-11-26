// import 'package:areness/searchscreen.dart';
import 'package:flutter/material.dart';

class FileListScreen extends StatefulWidget {
  @override
  _FileListScreenState createState() => _FileListScreenState();
}

class _FileListScreenState extends State<FileListScreen> {

  int _currentIndex = 1;

  final List<Map<String, String>> _data = [
    {'srNo': '1', 'name': 'Love', 'mobile': '9827010145', 'account': '120927', 'date': '22/11/2024'},
    {'srNo': '2', 'name': 'Harsh', 'mobile': '9827010145', 'account': '120927', 'date': '22/11/2024'},
    {'srNo': '3', 'name': 'Rajat', 'mobile': '9827010145', 'account': '120927', 'date': '22/11/2024'},
    {'srNo': '4', 'name': 'Aditya', 'mobile': '9827010145', 'account': '120927', 'date': '22/11/2024'},
    {'srNo': '5', 'name': 'Angela', 'mobile': '9827010145', 'account': '120927', 'date': '22/11/2024'},

  ];

  void _onBottomNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      print("Dashboard selected");
    } else if (index == 2) {
     // SearchScreen();
      print("Search selected");
    } else if (index == 3) {
      print("SBI selected");
    }
  }

  void _showDetailDialog(Map<String, String> rowData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name: ${rowData['name']}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text('Date: ${rowData['date']}'),
                SizedBox(height: 16),
                ListTile(
                  title: Text('SMS'),
                  trailing: Text('Delivered', style: TextStyle(color: Colors.green)),
                ),
                Divider(),
                ListTile(
                  title: Text('Email'),
                  trailing: Text('Delivered', style: TextStyle(color: Colors.green)),
                ),
                Divider(),
                ListTile(
                  title: Text('Whatsapp'),
                  trailing: Text('Delivered', style: TextStyle(color: Colors.green)),
                ),
                Divider(),
                ListTile(
                  title: Text('Indiapost'),
                  trailing: Text('Item Bagged', style: TextStyle(color: Colors.red)),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.picture_as_pdf, color: Colors.red),
                        SizedBox(height: 4),
                        Text('Notice Copy', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.picture_as_pdf, color: Colors.red),
                        SizedBox(height: 4),
                        Text('Tracking Details', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Files'),
        backgroundColor: Colors.white,
        elevation: 1,
        titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {
              print("Filter clicked");
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              print("Search clicked");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable(
            headingRowHeight: 40,
            dataRowHeight: 60,
            columnSpacing: 20,
            headingRowColor: MaterialStateColor.resolveWith((states) => Colors.orange.shade100),
            columns: const [
              DataColumn(label: Text('S. No.')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Mobile No.')),
              DataColumn(label: Text('Account')),
              DataColumn(label: Text('View')),
            ],
            rows: _data.map((row) {
              return DataRow(
                cells: [
                  DataCell(Text(row['srNo']!)),
                  DataCell(Text(row['name']!)),
                  DataCell(Text(row['mobile']!)),
                  DataCell(Text(row['account']!)),
                  DataCell(
                    GestureDetector(
                      onTap: () {
                        _showDetailDialog(row);
                      },
                      child: Text(
                        'View More',
                        style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavigationTap,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Files'),

          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),

          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'SBI'),
        ],
      ),
    );
  }
}
