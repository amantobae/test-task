import 'package:flutter/material.dart';
import 'package:flutter_application_1/drinks/presentation/screens/drink_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DrinkScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
