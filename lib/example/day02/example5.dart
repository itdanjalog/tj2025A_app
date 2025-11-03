import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 플러터 앱의 시작점
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IOExample(),
    );
  }
}

// StatefulWidget : 입력값 변화나 버튼 클릭에 따라 상태(State)가 변경될 수 있음
class IOExample extends StatefulWidget {
  @override
  _IOExampleState createState() => _IOExampleState();
}

class _IOExampleState extends State<IOExample> {
  // 입력값을 제어할 컨트롤러
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  // 화면에 표시할 텍스트 데이터
  String displayText = '';
  String displayText2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('입출력 위젯 실습333')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔹 입력 위젯(TextField)
            TextField(
              controller: controller,
              decoration: InputDecoration( labelText: '가이드 라인'),
            ),
            SizedBox(height: 10),

            // 2️⃣ 숫자 입력
            TextField(
              controller: controller2,
              decoration: InputDecoration(labelText: '나이 입력'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),

            // 🔹 버튼 (입력된 내용을 출력 텍스트로 반영)
            TextButton(
              onPressed: (){ setState( () { displayText = controller.text; });  },
              child: Text('출력하기'),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: (){ setState( () { displayText2 = controller2.text; });  },
              child: Text('출력하기2'),
            ),
            SizedBox(height: 10),

            // 🔹 출력 위젯(Text)
            Text( '입력 결과: ${displayText}'),
            SizedBox(height: 20),

            Text(
              '입력 결과: ${displayText2}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}


// 구분	_name	name
// 접근제어	private (파일 내부 한정)	public (다른 파일에서도 접근 가능)
// 코드 스타일	의미적으로 “숨기겠다”는 의도 표시	외부 공개용
// 기능 여부	실제 언어 기능 (접근 제한 작동)	공개됨