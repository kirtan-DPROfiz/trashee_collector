import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:trashee_collecter/core/Routes/routes.dart';
import 'package:trashee_collecter/core/Routes/routes_names.dart';
import 'package:trashee_collecter/core/auth/login_screen.dart';
import 'package:trashee_collecter/core/auth/signin_screen.dart';
import 'package:trashee_collecter/core/pages/DashboardPage/dashboard_screen.dart';
import 'package:trashee_collecter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    log(e.toString());
  }
  runApp(const TrasheeCollectorApp());
}

class TrasheeCollectorApp extends StatelessWidget {
  const TrasheeCollectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.instance.getToken().then(
      (value) {
        print("Your FCM token for device is  : $value");
      },
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trashee Collector',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      initialRoute: Routes.allbins,
      getPages: RouteNames.Pages,
      /*    routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/dashboard': (context) => HomeScreen(),
        // '/dashboard': (context) =>  HomeScreen(),
      } */
    );
  }
}
