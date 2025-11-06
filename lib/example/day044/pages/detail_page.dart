// Flutter의 머티리얼 디자인 위젯을 사용하기 위한 기본 패키지
import 'package:flutter/material.dart';

// 상세 페이지(DetailPage) 클래스 정의
// StatelessWidget : 상태 변화가 없는(고정된 화면을 가진) 위젯
class DetailPage extends StatelessWidget {
  // 화면을 그리는 빌드 메서드 (필수)
  @override
  Widget build(BuildContext context) {
    // Scaffold : 화면의 기본 뼈대를 제공하는 위젯 (상단바, 본문, 하단바 등 포함)
    return Scaffold(
      // 상단 앱바(AppBar) 영역 정의
      appBar: AppBar(
        title: Text('상세 페이지'), // 앱바에 표시될 제목
      ),

      // body : 화면의 주요 내용 부분
      body: Center( // Center : 화면의 중앙에 위젯을 배치
        child: Column( // 세로 방향으로 위젯을 나열
          mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
          children: [
            // Text : 단순 텍스트 출력 위젯
            Text('이곳은 상세 페이지입니다 🎯'),

            // SizedBox : 위젯 사이에 일정한 여백(공간)을 줌
            SizedBox(height: 20), // 세로로 20픽셀 간격 추가

            // ElevatedButton : 기본 입체형 버튼 위젯
            ElevatedButton(
              // onPressed : 버튼 클릭 시 실행될 함수 정의
              onPressed: () => Navigator.pop(context),
              // Navigator.pop() : 이전 화면으로 되돌아감 (뒤로가기 기능)
              child: Text('⬅ 돌아가기'), // 버튼 안에 표시할 텍스트
            ),
          ],
        ),
      ),
    );
  }
}
