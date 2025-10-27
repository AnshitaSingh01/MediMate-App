import 'package:flutter/material.dart';
import 'package:medimate/screens/feedback_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool taken = false;
  String nextDose = 'Paracetamol';
  String doseTime = '11:00 AM';

  void markTaken() {
    setState(() {
      taken = true;
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Marked as taken')));
  }

  void snooze() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Snoozed for 10 minutes')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MediMate'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () => Navigator.pushNamed(context, '/list'),
            tooltip: 'View all medicines',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              color: Colors.teal,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/pill.png',
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NEXT DOSE',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text('$nextDose',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text(
                            'Today • $doseTime',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.feedback),
                          label: const Text('Give feedback'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FeedbackScreen(),
                              ),
                            );
                          },
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: taken ? null : markTaken,
                              child: Text(taken ? 'Taken' : 'Mark as Taken'),
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton(
                              onPressed: snooze,
                              child: Text('Snooze'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading:
                  Icon(Icons.add_circle_outline, size: 36, color: Colors.teal),
              title: Text('Add New Medicine'),
              subtitle: Text('Quick add with photo & schedule'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Add flow (simulated)')));
              },
            ),
            SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/list'),
              icon: Icon(Icons.medical_services),
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child:
                    Text('View All Medicines', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
