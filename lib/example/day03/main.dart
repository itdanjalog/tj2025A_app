import 'package:flutter/material.dart';

void main() {
  runApp( TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 상단 디버그 배너 제거
      home: TodoPage(),
    );
  }
}

// ------------------------------------
// [1] StatefulWidget : 상태를 가지는 위젯
// ------------------------------------
class TodoPage extends StatefulWidget {
  TodoPageState createState() => TodoPageState();
}

// ------------------------------------
// [2] State 클래스 : 화면의 상태를 관리
// ------------------------------------
class TodoPageState extends State<TodoPage> {
   TextEditingController controller = TextEditingController(); // 입력값 제어
   List<String> todoList = []; // TODO 목록 저장

  void _addTodo() {
    setState(() {
      if (controller.text.isNotEmpty) {
        todoList.add(controller.text); // 리스트에 추가
        controller.clear(); // 입력창 초기화
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('📝 TODO 메모장'),
        backgroundColor: Colors.blueAccent,
      ),
      // -------------------------------
      // body : 입력 + 출력 영역
      // -------------------------------
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ✅ 입력 위젯
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration:  InputDecoration(
                      labelText: '할 일 입력...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                 SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTodo,
                  child:  Text('추가'),
                ),
              ],
            ),

             SizedBox(height: 20),

            // ✅ 출력 위젯 (목록)
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:  Icon(Icons.check_circle_outline),
                    title: Text(todoList[index]),
                    trailing: IconButton(
                      icon:  Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          todoList.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
