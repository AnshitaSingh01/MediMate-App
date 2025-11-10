import 'package:flutter/material.dart';
import 'medicine_detail_screen.dart'; // ✅ Create this file next

class MedicineListScreen extends StatelessWidget {
  const MedicineListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // You can later load this data from Firebase or local JSON
    final List<Map<String, dynamic>> medicines = [
      {
        'name': 'Paracetamol',
        'dosage': '1 tablet after breakfast',
        'time': '8:00 AM',
        'instructions': 'Take with water. Avoid on empty stomach.'
      },
      {
        'name': 'Amoxicillin',
        'dosage': '1 capsule twice daily',
        'time': '9:00 AM, 9:00 PM',
        'instructions': 'Take after meals. Complete full course.'
      },
      {
        'name': 'Vitamin D3',
        'dosage': '1 tablet daily',
        'time': '7:30 AM',
        'instructions': 'Take with milk or breakfast.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Medicine List"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          final medicine = medicines[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading:
                  const Icon(Icons.medication, color: Colors.teal, size: 30),
              title: Text(
                medicine['name'],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(medicine['dosage']),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),

              // ✅ Make clickable
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicineDetailScreen(
                      name: medicine['name'],
                      dosage: medicine['dosage'],
                      time: medicine['time'],
                      instructions: medicine['instructions'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
