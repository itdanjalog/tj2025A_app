import 'package:flutter/material.dart';
import 'pages/main_page.dart';
import 'pages/home_page.dart';
import 'pages/info_page.dart';
import 'pages/setting_page.dart';
import 'pages/detail_page.dart';
import 'pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Route + 하단 네비게이션',
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/home': (context) => HomePage(),
        '/info': (context) => InfoPage(),
        '/setting': (context) => SettingPage(),
        '/detail': (context) => DetailPage(),
        '/login': (context) => LoginPage(), // ✅ 추가

      },
    );
  }
}
