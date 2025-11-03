import 'package:flutter/material.dart';
import '../models/medicine.dart';

class MedicineDetailScreen extends StatelessWidget {
  final Medicine medicine;
  const MedicineDetailScreen({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(medicine.name), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              color: Colors.teal,
              child: const Center(
                  child: Text('PILL',
                      style: TextStyle(color: Colors.white, fontSize: 20))),
            ),
            const SizedBox(height: 20),
            Text(medicine.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Time: ${medicine.time}'),
            Text('Dose: ${medicine.dose}'),
            Text(
                'Description: ${medicine.notes.isEmpty ? 'No details available' : medicine.notes}'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {}, child: const Text('Add to Schedule')),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back')),
          ],
        ),
      ),
    );
  }
}
