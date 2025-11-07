// lib/example/day04/pages/MainPage.dart
import 'package:flutter/material.dart';
import 'package:tj2025app/example/day04/pages/HomePage.dart';
import 'package:tj2025app/example/day04/pages/InfoPage.dart';
import 'package:tj2025app/example/day04/pages/SettingPage.dart';

class MainPage extends StatefulWidget{
  MainPageState createState() => MainPageState();
}
class MainPageState extends State<MainPage>{ // 상태(state) 가 있는 위젯
  int currentPageIndex = 0; // 현재 화면에 보이는 페이지 (인덱스) 번호
  // 인덱스별 위젯(페이지) 목록
  dynamic pages = [ // vs List<Widget> pages = [];
    HomePage() , // 인덱스 0 -> 홈 페이지
    InfoPage() , // 인덱스 1 -> 정보 페이지
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( index : currentPageIndex , children: pages  ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPageIndex , // 현재 선택 된 버튼 번호 설정
          onTap : (index){ setState(() { currentPageIndex = index; } ); } , // 바텀메뉴 중 하나의 탭 눌렀을때
          items: [ // 바텀메뉴에 들어갈 버튼들
            BottomNavigationBarItem(
                icon: Icon( Icons.home) ,
                label: "홈"), // 0번
            BottomNavigationBarItem(
                icon: Icon( Icons.info , size: 30 ) ,
                label : "정보" ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings , color: Colors.red,) ,
                label: "설정"
            )
          ]
      ),
    );
  }
}





