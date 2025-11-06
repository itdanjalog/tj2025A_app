// Flutter의 머티리얼 디자인 위젯을 사용하기 위한 기본 패키지
import 'package:flutter/material.dart';

// 각각의 하위 페이지 파일 불러오기
import 'home_page.dart';     // 홈 페이지 위젯 파일
import 'info_page.dart';     // 정보 페이지 위젯 파일
import 'setting_page.dart';  // 설정 페이지 위젯 파일

// MainPage 클래스 : 앱의 주요 페이지(하단 네비게이션이 포함됨)
// StatefulWidget : 상태(변화)가 있는 위젯을 만들 때 사용
class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState(); // 상태 객체(MainPageState) 생성
}

// MainPageState 클래스 : MainPage의 실제 동작과 화면을 정의하는 부분
class MainPageState extends State<MainPage> {
  // 현재 선택된 탭(페이지)의 인덱스 번호를 저장하는 변수
  int currentIndex = 0;

  // 표시할 페이지 목록 (리스트 형태)
  // dynamic : 자료형이 고정되지 않지만, 여기서는 각 페이지 위젯(HomePage 등)이 들어감
  dynamic pages = [
    HomePage(),    // 인덱스 0 → 홈 페이지
    InfoPage(),    // 인덱스 1 → 정보 페이지
    SettingPage(), // 인덱스 2 → 설정 페이지
  ];

  // 화면을 그리는 빌드 함수 (모든 위젯은 build() 안에서 반환됨)
  @override
  Widget build(BuildContext context) {
    return Scaffold( // 머티리얼 앱의 기본 화면 구조 제공 (상단바, 본문, 하단바 등 포함)

      // body : 실제 페이지 내용 부분
      // IndexedStack : 여러 페이지를 겹쳐두고, 선택된 인덱스만 보이게 함
      body: IndexedStack(index: currentIndex, children: pages),

      // bottomNavigationBar : 하단 탭 네비게이션 바 정의
      bottomNavigationBar: BottomNavigationBar(
        // 현재 선택된 탭 번호 설정
        currentIndex: currentIndex,

        // 탭을 눌렀을 때 실행되는 콜백 함수
        onTap: (index) {
          setState(() {
            // 선택된 탭의 인덱스를 변경하고 화면 다시 그림
            currentIndex = index;
          });
        },

        // 하단 네비게이션에 표시할 버튼(아이콘 + 라벨) 리스트
        items: [
          // 첫 번째 탭 : 홈
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // 아이콘 모양
            label: '홈',             // 아이콘 아래 텍스트
          ),

          // 두 번째 탭 : 정보
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: '정보',
          ),

          // 세 번째 탭 : 설정
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30), // 아이콘 크기 조정
            label: '설정',
          ),
        ],
      ),
    );
  }
}
