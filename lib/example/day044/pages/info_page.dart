import 'package:flutter/material.dart';
import 'package:tj2025app/example/day044/widgets/commonAppBar.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, '정보'),
      body: Center(
        child: Text('앱 정보 페이지입니다 📘'),
      ),
    );
  }
}
