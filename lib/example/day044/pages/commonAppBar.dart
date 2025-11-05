import 'package:flutter/material.dart';

AppBar commonAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
        icon: Padding(
            child: Icon(Icons.account_circle, color: Colors.black12 , size: 50),
            padding: EdgeInsetsGeometry.fromLTRB(0, 0, 15, 0)  ),
        tooltip: '로그인',
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
    ],
  );
}
