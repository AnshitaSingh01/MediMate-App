import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Accessible app bar
      appBar: AppBar(
        title: Text('MediMate'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            Image.asset('assets/images/placeholder.png', height: 140),
            SizedBox(height: 24),
            Text('Welcome to MediMate', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Sign in to continue', style: TextStyle(fontSize: 16, color: Colors.black54)),
            SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email or phone',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
                child: Text('Sign In', style: TextStyle(fontSize: 18)),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}