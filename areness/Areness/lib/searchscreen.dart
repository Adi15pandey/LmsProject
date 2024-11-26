import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Card(
                      color: Colors.grey[100],
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item['S. No.']!),
                            Text(item['Notice Type']!),
                            Text(item['Date']!),
                            Text(item['Account No.']!),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
              'Results for: $searchQuery',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
