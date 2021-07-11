import 'package:covi_tracker/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(Starting());
}

class Starting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pandemic Tracker",
      home: MainScreen(),
      theme: ThemeData(
          backgroundColor: Color(0xFF1D1E33), primaryColor: Color(0xFF111328)),
    );
  }
}
