import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// -----------------------------
// [1] 앱 진입점
// -----------------------------
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Route + 하단 네비게이션',
      theme: ThemeData(primarySwatch: Colors.indigo),

      // ✅ 첫 페이지 지정
      initialRoute: '/',

      // ✅ 라우터 등록
      routes: {
        '/': (context) => MainPage(),
        '/home': (context) => HomePage(),
        '/info': (context) => InfoPage(),
        '/setting': (context) => SettingPage(),
        '/detail': (context) => DetailPage(),
      },
    );
  }
}

// -----------------------------
// [2] 메인 페이지 (탭 구조)
// -----------------------------
class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;

  dynamic pages = [
    HomePage(),
    InfoPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ IndexedStack으로 변경
      body: IndexedStack(  index: currentIndex, children: pages, ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){ setState( (){currentIndex = index;}); },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: '정보'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
        ],
      ),
    );
  }
}


// -----------------------------
// [3] 홈 페이지
// -----------------------------
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('홈')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // ✅ 상세 페이지로 이동 (Named Route 사용)
            Navigator.pushNamed(context, '/detail');
          },
          child: Text('상세 페이지로 이동'),
        ),
      ),
    );
  }
}

// -----------------------------
// [4] 정보 페이지
// -----------------------------
class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('정보')),
      body: Center(
        child: Text('앱 정보 페이지입니다 📘'),
      ),
    );
  }
}

// -----------------------------
// [5] 설정 페이지
// -----------------------------
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('설정')),
      body: Center(
        child: Text('설정 페이지 ⚙️'),
      ),
    );
  }
}

// -----------------------------
// [6] 상세 페이지
// -----------------------------
class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('상세 페이지')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('이곳은 상세 페이지입니다 🎯'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('⬅ 돌아가기'),
            ),
          ],
        ),
      ),
    );
  }
}
