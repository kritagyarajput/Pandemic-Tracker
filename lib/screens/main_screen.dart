import 'package:covi_tracker/screens/first_navigation_screen.dart';
import 'package:covi_tracker/screens/second_navigation_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF110322),
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Covid Tracker For 🇮🇳',
            style: TextStyle(
              fontSize: 28.0,
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0xFF111328),
        child: Center(
          child: (selectedIndex == 0)
              ? FirstNavigationScreen()
              : SecondNavigationScreen(),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            FontAwesomeIcons.chartBar,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            FontAwesomeIcons.map,
            size: 30.0,
            color: Colors.white,
          ),
        ],
        color: Color(0xFF110322),
        backgroundColor: Color(0xFF111328),
        height: 60.0,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: onItemTapped,
      ),
    );
  }
}
