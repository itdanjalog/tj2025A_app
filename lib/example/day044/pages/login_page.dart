import 'package:flutter/material.dart';
import 'package:tj2025app/example/day044/pages/commonAppBar.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("로그인") ),
      body: Center(
        child: Text('로그인 페이지 ️'),
      ),
    );
  }
}
