// Flutter의 머티리얼 디자인 위젯을 사용하기 위한 기본 패키지
import 'package:flutter/material.dart';

// 공통 상단바(AppBar)를 만드는 함수 정의
// [매개변수 설명]
// - BuildContext context : 현재 화면의 위젯 트리 위치 정보 (화면 이동 등에 필요)
// - String title : AppBar의 제목으로 표시할 문자열
AppBar commonAppBar(BuildContext context, String title) {
  // AppBar 위젯을 반환
  return AppBar(
    // 상단바의 가운데 제목
    title: Text(title),

    // actions : 오른쪽에 배치할 버튼이나 아이콘 목록 (리스트 형태)
    actions: [
      // IconButton : 클릭 가능한 아이콘 버튼
      IconButton(
        // icon 속성 : 실제로 표시할 아이콘 위젯
        icon: Padding(
          // Padding 위젯 : 아이콘 주변에 여백을 줌
          padding: EdgeInsetsGeometry.fromLTRB(0, 0, 15, 0), // 왼, 위, 오른, 아래 순서
          // Icon 위젯 : 계정 아이콘 모양 설정
          child: Icon(
            Icons.account_circle,            // 사람 얼굴 모양의 기본 계정 아이콘
            color: Colors.lightBlueAccent,   // 아이콘 색상 (연한 파란색)
            size: 50,                        // 아이콘 크기(px)
          ),
        ),

        // tooltip : 아이콘에 마우스를 올렸을 때(또는 길게 눌렀을 때) 표시되는 설명문
        tooltip: '로그인',

        // onPressed : 버튼 클릭 시 실행할 동작 정의
        onPressed: () {
          // Navigator.pushNamed() : 라우트 이름을 이용해 화면 이동
          // '/login' 경로로 이동 (main.dart의 routes에 정의된 페이지로 이동)
          Navigator.pushNamed(context, '/login');
        },
      ),
    ],
  );
}
