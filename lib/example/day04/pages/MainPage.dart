// lib/example/day04/pages/MainPage.dart
import 'package:flutter/material.dart';
import 'package:tj2025app/example/day04/pages/HomePage.dart';

class MainPage extends StatefulWidget{
  MainPageState createState() => MainPageState();
}
class MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}





