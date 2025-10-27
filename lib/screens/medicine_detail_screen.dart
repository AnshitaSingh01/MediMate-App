import 'package:flutter/material.dart';

class MedicineDetailScreen extends StatefulWidget {
  @override
  State<MedicineDetailScreen> createState() => _MedicineDetailScreenState();
}

class _MedicineDetailScreenState extends State<MedicineDetailScreen> {
  bool addedToSchedule = false;
  @override
  Widget build(BuildContext context) {
    final med =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ??
            {};

    /* {
              'name': 'Paracetamol',
              'time': '11:00 AM',
              'desc': 'Pain relief / fever reducer',
              'image': 'assets/images/pill.png'
            };*/

    return Scaffold(
      appBar: AppBar(
        title: Text(med['name']?.toString() ?? 'Medicine Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              (med['image'] != null && med['image'] is String)
                  ? med['image']
                  : 'assets/images/pill.png',
              height: 160,
            ),
            SizedBox(height: 12),
            Text(
              med['name'] != null ? med['name'].toString() : 'No Name',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Time: ${med['time'] != null ? med['time'].toString() : 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Dose: ${med['dose'] != null ? med['dose'].toString() : 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${med['desc'] != null ? med['desc'].toString() : 'No details available'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Medicine added to schedule'),
                  ),
                );
              },
              child: Text('Add to Schedule'),
            ),
            SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
