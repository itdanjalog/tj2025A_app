import 'package:flutter/material.dart';
import 'package:tj2025app/example/day044/widgets/commonAppBar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, '메인 홈 로고'),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/detail');
          },
          child: Text('상세 페이지로 이동'),
        ),
      ),
    );
  }
}
