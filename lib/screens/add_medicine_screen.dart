import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/medicine.dart';
import '../services/storage_service.dart';
import '../services/notification_service.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  TimeOfDay? selectedTime;

  Future<void> _saveMedicine() async {
    if (_nameController.text.isEmpty || selectedTime == null) return;
    final now = DateTime.now();
    final scheduledTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );

    final med = Medicine(
      id: const Uuid().v4(),
      name: _nameController.text,
      dose: _doseController.text,
      time: selectedTime!.format(context),
      notes: _notesController.text,
    );

    await StorageService.saveMedicine(med);
    await NotificationService.scheduleNotification(
      id: med.id,
      title: 'Time for your medicine',
      body: '${med.name} - ${med.dose}',
      scheduledTime: scheduledTime,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Medicine added and reminder set!')),
    );
    Navigator.pop(context, true);
  }

  void _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) setState(() => selectedTime = time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Add Medicine'), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Medicine Name')),
            TextField(
                controller: _doseController,
                decoration: const InputDecoration(labelText: 'Dose')),
            TextField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes')),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(selectedTime == null
                    ? 'No time selected'
                    : 'Time: ${selectedTime!.format(context)}'),
                TextButton(
                    onPressed: _pickTime, child: const Text('Pick Time')),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: _saveMedicine, child: const Text('Save Medicine')),
          ],
        ),
      ),
    );
  }
}
