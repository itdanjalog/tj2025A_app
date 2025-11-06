// Flutter의 머티리얼 디자인 위젯들을 사용하기 위해 material.dart를 불러옴
import 'package:flutter/material.dart';

// 각 페이지 파일들을 불러오기 (같은 폴더 안의 pages 폴더에 존재)
import 'pages/main_page.dart';   // 메인 페이지
import 'pages/home_page.dart';   // 홈 페이지
import 'pages/info_page.dart';   // 정보 페이지
import 'pages/setting_page.dart';// 설정 페이지
import 'pages/detail_page.dart'; // 상세보기 페이지
import 'pages/login_page.dart';  // 로그인 페이지

// 프로그램 실행 진입점 (main 함수)
// runApp() : 플러터 앱을 시작하는 함수
// MyApp() : 아래에서 정의한 루트 위젯을 실행
void main() => runApp(MyApp());

// MyApp 클래스 : 앱 전체의 뼈대가 되는 최상위 위젯
class MyApp extends StatelessWidget {
  // build() : 위젯이 화면에 어떻게 보일지 정의하는 함수
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 앱 시작 시 처음 표시할 경로 지정 ('/'는 기본 루트 페이지)
      initialRoute: '/',

      // routes : 경로(이름)와 해당 페이지 위젯을 연결하는 맵(Map)
      routes: {
        // '/' 경로 → MainPage() 위젯 표시
        '/': (context) => MainPage(),

        // '/home' 경로 → HomePage() 위젯 표시
        '/home': (context) => HomePage(),

        // '/info' 경로 → InfoPage() 위젯 표시
        '/info': (context) => InfoPage(),

        // '/setting' 경로 → SettingPage() 위젯 표시
        '/setting': (context) => SettingPage(),

        // '/detail' 경로 → DetailPage() 위젯 표시
        '/detail': (context) => DetailPage(),

        // '/login' 경로 → LoginPage() 위젯 표시
        // ✅ 새로 추가된 로그인 페이지 라우트
        '/login': (context) => LoginPage(),
      },
    );
  }
}
