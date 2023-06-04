import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manula_perera_flutter_interview/screens/splash_screen.dart';

void main() {
  // Set the status bar color to transparent
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          // Set the status bar color to transparent
          statusBarIconBrightness:
          Brightness.dark, // Set the status bar icons to dark color
          ),
      );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}
