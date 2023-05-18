import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // to make our own theme
          primarySwatch: Colors.red,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
          ),
          dividerColor: Colors.amber,
          fontFamily: 'Montserrat Alternates'),
      home: const HomePage(),
    );
  }
}
