import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🏠 홈 페이지')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/todo'); // ✅ 이름으로 이동
          },
          child: const Text('TODO 페이지로 이동'),
        ),
      ),
    );
  }
}
