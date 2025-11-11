
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
final dio = Dio();

class Update extends StatefulWidget{
  UpdateState createState()=>UpdateState();
}
class UpdateState extends State<Update>{
  // 1. 부모(위젯) 으로 부터 매개변수 받기
  @override
  void didChangeDependencies() {
    int id = ModalRoute.of( context )!.settings.arguments as int ;
    findById( id ); //
  }
  // 2. 현재 수정할 데이터 서버로 부터 가져오기
  dynamic todo = {};
  void findById( int id ) async{
    try{
      final response = await dio.get("http://192.168.40.185:8080/api/todo/detail?id=${id}");
      final data = await response.data;
      setState(() {
        todo = data;
        titleCont.text = data['title'];
        contentCont.text = data['content'];
      });
    }catch(e){ print(e); }
  }
  // 3. 입력상자를 제어 하는 컨트롤러
  TextEditingController titleCont = TextEditingController(); // 제목 수정 입력상자 제어
  TextEditingController contentCont = TextEditingController(); // 내용 수정 입력상자 제어

  // 4. Spring 서버로 부터 업데이트 요청
  void update() async{
    try{
      final obj = {
        "id" : todo['id'],
        "title" : titleCont.text, // 수정할 제목은 입력상자에서
        "content" : contentCont.text , // 수정할 내용은 입력상자에서
        "done" : todo['done']
      };
      final response = await dio.put("http://192.168.40.185:8080/api/todo", data : obj );
      final data = await response.data; print( data );
      if( data != null ){ Navigator.pop(context , true); } 
      // 만약에 수정 성공시 뒤로가기. 즉] 현재 위젯를 제거 하면서 두번째 매개변수로 true 반환
    }catch(e){ print(e); }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("TODO 수정"),),
      body: Column(
        children: [
          TextField( controller: titleCont , maxLength: 30 ), // 입력최대길이
          SizedBox( height: 20 ),

          TextField( 
              controller: contentCont ,  maxLength: 255,
              maxLines: 5, // 세로 최대 길이 = 내용이 넘치면 자동 스크롤
          ),  
          SizedBox( height: 20 ),

          Text("완료 여부"),
          Switch(
              value: todo['done'], // true:on , false : off
              onChanged: ( value ){ setState(() { todo['done'] = value; }); }
          ),
          SizedBox( height: 20 ),

          OutlinedButton(onPressed: update , child: Text("수정하기") )
        ],
      )
    );
  }
}