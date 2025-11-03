import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MedicineListScreen extends StatefulWidget {
  const MedicineListScreen({super.key});

  @override
  State<MedicineListScreen> createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends State<MedicineListScreen> {
  List<dynamic> medicines = [];

  // Load JSON file from assets
  Future<void> loadMedicineData() async {
    final String response =
        await rootBundle.loadString('assets/medicine_data.json');
    final data = await json.decode(response);
    setState(() {
      medicines = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadMedicineData(); // Load data when screen starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medicine List"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: medicines.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final medicine = medicines[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: const Icon(Icons.medication, color: Colors.teal),
                    title: Text(
                      medicine['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      "${medicine['dose']} • ${medicine['time']}",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
