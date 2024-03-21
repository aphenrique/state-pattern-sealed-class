import 'package:flutter/material.dart';
import 'package:state_management/features/home/presentation/home_controller.dart';
import 'package:state_management/features/home/presentation/home_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(controller: controller),
    );
  }
}
