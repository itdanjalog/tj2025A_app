import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  int _selectedIndex = 0; // 현재 선택된 화면 (0=할일, 1=완료)

  // 샘플 데이터
  final List<String> _todoList = ['Dart 공부하기', 'Flutter 실습하기'];
  final List<String> _doneList = ['아침 운동하기'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📝 TODO 페이지'),
      ),
      body: Column(
        children: [
          // ---------------------------
          // [1] 버튼 영역
          // ---------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  _selectedIndex == 0 ? Colors.blue : Colors.grey,
                ),
                child: const Text('할 일 목록'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  _selectedIndex == 1 ? Colors.blue : Colors.grey,
                ),
                child: const Text('완료된 목록'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ---------------------------
          // [2] 본문 전환 영역
          // ---------------------------
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300), // 전환 애니메이션
              child: _selectedIndex == 0
                  ? _buildTodoList() // 할일 화면
                  : _buildDoneList(), // 완료 화면
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------
  // [3] 할 일 목록 위젯
  // ---------------------------
  Widget _buildTodoList() {
    return ListView.builder(
      key: const ValueKey('todoList'),
      itemCount: _todoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.check_box_outline_blank),
          title: Text(_todoList[index]),
          trailing: IconButton(
            icon: const Icon(Icons.done, color: Colors.green),
            onPressed: () {
              setState(() {
                _doneList.add(_todoList[index]);
                _todoList.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }

  // ---------------------------
  // [4] 완료된 목록 위젯
  // ---------------------------
  Widget _buildDoneList() {
    return ListView.builder(
      key: const ValueKey('doneList'),
      itemCount: _doneList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.check_circle, color: Colors.blue),
          title: Text(
            _doneList[index],
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {
                _doneList.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }
}
