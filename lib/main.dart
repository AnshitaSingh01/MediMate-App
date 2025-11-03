import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_medicine_screen.dart';
import 'screens/medicine_list_screen.dart';
import 'screens/feedback_screen.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  runApp(const MediMateApp());
}

class MediMateApp extends StatelessWidget {
  const MediMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediMate',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/add': (context) => const AddMedicineScreen(),
        '/list': (context) => const MedicineListScreen(),
        '/feedback': (context) => const FeedbackScreen(),
      },
    );
  }
}
