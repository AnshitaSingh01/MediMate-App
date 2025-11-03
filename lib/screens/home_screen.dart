import 'package:flutter/material.dart';
import 'add_medicine_screen.dart';
import 'medicine_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool taken = false;

  void _markAsTaken() {
    setState(() => taken = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Marked as Taken ✅')),
    );
  }

  void _snoozeReminder() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reminder snoozed for 5 minutes ⏰')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('MediMate'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MedicineListScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Reminder Card
                Card(
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'NEXT DOSE',
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Paracetamol',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Today • 11:00 AM',
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/feedback');
                              },
                              child: const Text('Give Feedback'),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(color: Colors.white70),
                              ),
                              onPressed: _markAsTaken,
                              child: const Text('Mark as Taken'),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(color: Colors.white70),
                              ),
                              onPressed: _snoozeReminder,
                              child: const Text('Snooze'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Add New Medicine
                ListTile(
                  leading: const Icon(Icons.add_circle_outline,
                      color: Colors.teal, size: 36),
                  title: const Text(
                    'Add New Medicine',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Quick add with photo & schedule'),
                  onTap: () async {
                    final added = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const AddMedicineScreen()),
                    );
                    if (added == true) {
                      setState(() {}); // refresh UI
                    }
                  },
                ),
                const Divider(),
                const SizedBox(height: 12),

                // My Medicines Button
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.medical_services),
                    label: const Text(
                      'My Medicines',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MedicineListScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
