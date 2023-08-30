import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi/homepage.dart'; // Pastikan path-nya sesuai dengan struktur proyek Anda

void main() {
  runApp(GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
