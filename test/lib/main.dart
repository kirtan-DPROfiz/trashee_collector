import 'package:flutter/material.dart';
import 'package:trashee_collector/core/auth/login_screen.dart';
import 'package:trashee_collector/core/auth/signin_screen.dart';
import 'package:trashee_collector/core/pages/dashboard_screen.dart';

void main() {
  runApp(const TrasheeCollectorApp());
}

class TrasheeCollectorApp extends StatelessWidget {
  const TrasheeCollectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trashee Collector',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/dashboard': (context) =>  HomeScreen(),
        // '/dashboard': (context) =>  HomeScreen(),
      },
    );
  }
}
