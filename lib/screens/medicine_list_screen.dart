import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../models/medicine.dart';
import 'medicine_detail_screen.dart';

class MedicineListScreen extends StatefulWidget {
  const MedicineListScreen({super.key});

  @override
  State<MedicineListScreen> createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends State<MedicineListScreen> {
  List<Medicine> medicines = [];

  @override
  void initState() {
    super.initState();
    loadMedicines();
  }

  Future<void> loadMedicines() async {
    final data = await StorageService.getMedicines();
    setState(() => medicines = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('My Medicines'), backgroundColor: Colors.teal),
      body: medicines.isEmpty
          ? const Center(child: Text('No medicines added yet'))
          : ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final med = medicines[index];
                return ListTile(
                  leading: const Icon(Icons.medication, color: Colors.teal),
                  title: Text(med.name),
                  subtitle: Text('${med.dose} - ${med.time}'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MedicineDetailScreen(medicine: med)),
                  ),
                );
              },
            ),
    );
  }
}
