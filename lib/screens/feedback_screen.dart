import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final feedbackController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
          title: const Text('Send Feedback'), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 10),
            TextField(
                controller: feedbackController,
                decoration: const InputDecoration(labelText: 'Your Feedback')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
