import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Route 예제',
      debugShowCheckedModeBanner: false,

      // ✅ 라우트 등록
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/todo': (context) => const TodoPage(),
      },
    );
  }
}
