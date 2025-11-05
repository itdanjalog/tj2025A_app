// lib/example/day03/example2.dart
import 'package:flutter/material.dart';
// [1]
void main(){
  runApp( MyApp() ); // 최초로 실행할 위젯
}
// [2] 위젯 만들기 < 최초 메인 위젯  , App.jsx 같은 역할 >
class MyApp extends StatelessWidget{ // 상태(useState)가 없는 위젯
  @override // 위젯이란? 클래스 기반 이라서 , 위젯 만든다는것은 객체 생성한다 뜻
  Widget build(BuildContext context) {
    return MaterialApp( home : GoodsWidget() );
  }
}
// [3] 위젯 만들기2 < 페이지 > , 컴포넌트 역할
class GoodsWidget extends StatefulWidget{  // 상태(useSate) 가 있는 위젯
  // 상태 위젯 생성/등록
  @override GoodsWidgetState createState() => GoodsWidgetState();
}

// [4] 상태 하위 위젯
class GoodsWidgetState extends State<GoodsWidget>{
  // [4-1] 입력 상자의 컨트롤러
  TextEditingController nameCont = TextEditingController();
  TextEditingController priceCont = TextEditingController();
  TextEditingController descCont = TextEditingController();

  // [4-2] goodsSave 함수정의
  void goodsSave (){
    final obj = {
      'gname' : nameCont.text ,
      'gprice' : priceCont.text ,
      'gdesc' : descCont.text
    }; print( obj );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("제품 현황") ),
      body: Padding( 
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
             TextField(
               decoration: InputDecoration( labelText: "제품명") ,
               controller: nameCont ,
             ) ,
             SizedBox( height: 20 ) ,

             TextField(
               decoration: InputDecoration( labelText: "제품가격") ,
               keyboardType: TextInputType.number, // 모바일 환경에서 키보드 형식을 숫자패드
               controller: priceCont,
             ) ,
             SizedBox( height: 20 ) ,

             TextField(
               decoration: InputDecoration( labelText: "제품설명"),
               controller: descCont,
             ) ,
             SizedBox( height: 50 ) ,

             ElevatedButton( onPressed: goodsSave , child: Text("제품등록") ) ,
          ],
        ),
      ),
    );
  }
} 
// Padding : 안쪽 여백
// Column( children : [ 위젯, 위젯 , 위젯 ] ) : 세로 정렬 ,









