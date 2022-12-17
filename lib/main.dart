import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/color.dart';

import 'HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Sepia Pets',
      theme: ThemeData(
        primarySwatch:Colors.blue
      ),
      home: const MyHomePage(title: 'Sepia Pets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
     DateTime specificDate = DateTime.now()
      .add(const Duration(seconds: 3)); 
   @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen()
    );
  }
}

