import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SearchScreen(),
  ));
}

class SearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  void _performSearch(BuildContext context) {
    String searchQuery = _searchController.text;

    // Navigate to the SearchResultScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultScreen(searchQuery: searchQuery),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Search by ACC/No.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter ACC/No.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _performSearch(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: Colors.grey[500],
              ),
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResultScreen extends StatelessWidget {
  final String searchQuery;

  SearchResultScreen({required this.searchQuery});

  final List<Map<String, String>> data = [
    {'S. No.': '1', 'Notice Type': 'DLN', 'Date': '22/11/2024', 'Account No.': '182837'},
    {'S. No.': '2', 'Notice Type': 'QLD', 'Date': '22/11/2024', 'Account No.': '182837'},
    {'S. No.': '3', 'Notice Type': 'Execution', 'Date': '22/11/2024', 'Account No.': '182837'},
    {'S. No.': '4', 'Notice Type': 'Conciliation', 'Date': '22/11/2024', 'Account No.': '182837'},
    {'S. No.': '5', 'Notice Type': 'Conciliation', 'Date': '22/11/2024', 'Account No.': '182837'},
    {'S. No.': '6', 'Notice Type': 'QLD', 'Date': '21/11/2024', 'Account No.': '182837'},
    {'S. No.': '7', 'Notice Type': 'Execution', 'Date': '21/11/2024', 'Account No.': '182837'},
    {'S. No.': '8', 'Notice Type': 'QLD', 'Date': '21/11/2024', 'Account No.': '182837'},
    {'S. No.': '9', 'Notice Type': 'DLN', 'Date': '20/11/2024', 'Account No.': '182837'},
    {'S. No.': '10', 'Notice Type': 'Execution', 'Date': '20/11/2024', 'Account No.': '182837'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Column(
        children: [
          // Add the new header section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'S. No.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Notice Type',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Account No.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
          ),

          // Render the table below the header
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  color: index % 2 == 0 ? Colors.grey[100] : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          data[index]['S. No.']!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          data[index]['Notice Type']!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          data[index]['Date']!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          data[index]['Account No.']!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            label: 'Files',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'SBI',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle navigation logic here
        },
      ),
    );
  }
}


