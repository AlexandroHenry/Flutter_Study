import 'package:flutter/material.dart';
import 'package:flutter_study/feature/home_screen.dart';
import 'package:get/get.dart';

void main() {
  // Ensure our color patches are loaded

  runApp(
    GetMaterialApp(
      title: "FLUTTER STUDY",
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
    ),
  );
}
