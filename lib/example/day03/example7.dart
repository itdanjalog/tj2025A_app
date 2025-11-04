import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(BoardApp());
}

class BoardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BoardPage(),
    );
  }
}

class BoardPage extends StatefulWidget {
  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  final Dio dio = Dio();
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController contentCtrl = TextEditingController();

  dynamic boardList = [];

  /// ✅ 게시물 등록 (POST)
  void createBoard() async {
    try {
      final response = await dio.post(
        'http://221.168.154.198:8080/api/board',
        data: {
          "btitle": titleCtrl.text,
          "bcontent": contentCtrl.text,
          "cno": 1, // 카테고리 기본값
        },
      );
      debugPrint("등록 결과: ${response.data}");
      fetchBoards(); // 등록 후 목록 갱신
    } catch (e) {
      debugPrint("등록 오류: $e");
    }
  }

  /// ✅ 게시물 전체 조회 (GET)
  void fetchBoards() async {
    try {
      final response = await dio.get('http://221.168.154.198:8080/api/board');
      setState(() {
        boardList = response.data;
      });
      debugPrint("조회 결과: ${response.data}");
    } catch (e) {
      debugPrint("조회 오류: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBoards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("📋 게시판 목록")),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ✅ 게시물 등록 입력폼
            TextField(
              controller: titleCtrl,
              decoration:  InputDecoration(labelText: "제목"),
            ),
            TextField(
              controller: contentCtrl,
              decoration:  InputDecoration(labelText: "내용"),
            ),
             SizedBox(height: 10),
            ElevatedButton(
              onPressed: createBoard,
              child:  Text("게시물 등록"),
            ),
             Divider(height: 30),
            // ✅ 게시물 목록 출력
            Expanded(
              child: ListView.builder(
                itemCount: boardList.length,
                itemBuilder: (context, index) {
                  dynamic item = boardList[index];
                  return Card(
                    child: ListTile(
                      title: Text(item['btitle'] ?? ''),
                      subtitle: Text(item['bcontent'] ?? ''),
                      trailing: Text("카테고리: ${item['cno']}"),
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
