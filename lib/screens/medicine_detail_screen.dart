import 'package:flutter/material.dart';

class MedicineDetailScreen extends StatelessWidget {
  final String name;
  final String dosage;
  final String time;
  final String instructions;

  const MedicineDetailScreen({
    super.key,
    required this.name,
    required this.dosage,
    required this.time,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "💊 $name",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text("🕒 Time: $time", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("💧 Dosage: $dosage", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("📋 Instructions: $instructions",
                style: const TextStyle(fontSize: 18)),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Back to List"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
