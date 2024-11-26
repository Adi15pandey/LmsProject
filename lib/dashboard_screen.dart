import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Dashboard Screen'),
    );
  }
}
// import 'package:flutter/material.dart';
//
// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             DashboardCard(
//               title: 'Email',
//               amount: '₹ 51,858',
//               percentage: '+5%',
//               icon: Icons.email,
//             ),
//             DashboardCard(
//               title: 'SMS',
//               amount: '₹ 11,128',
//               percentage: '+5%',
//               icon: Icons.message,
//             ),
//             DashboardCard(
//               title: 'WhatsApp',
//               amount: '₹ 16,342',
//               percentage: '+6%',
//               icon: Icons.chat,
//             ),
//             DashboardCard(
//               title: 'IndiaPost',
//               amount: '₹ 47,858',
//               percentage: '-4%',
//               icon: Icons.local_post_office,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Container(
//                 height: 400,
//                 color: Colors.grey[200],
//                 child: Center(child: Text('Average Payment Chart Placeholder')),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Container(
//                 height: 400,
//                 color: Colors.grey[200],
//                 child: Center(child: Text('Greige Stocks Chart Placeholder')),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DashboardCard extends StatelessWidget {
//   final String title;
//   final String amount;
//   final String percentage;
//   final IconData icon;
//
//   DashboardCard({
//     required this.title,
//     required this.amount,
//     required this.percentage,
//     required this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: Icon(icon, size: 40),
//         title: Text(title),
//         subtitle: Text(amount),
//         trailing: Text(percentage),
//       ),
//     );
//   }
// }

