// lib/example/day03/example2.dart
import 'package:dio/dio.dart';
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
  void goodsSave () async {
    final obj = { 'gname' : nameCont.text, 'gprice' : priceCont.text,'gdesc' : descCont.text };
    print( obj );
    try{
      final dio = Dio(); // [1] Dio 객체 생선한다. // [2] 주의할점 : web[HTTP있음] 모바일[HTTP없음]
      // (web) 빌드시 : localhost:8080 가능 , (mobile) : 192.168.40.185:8080 만 가능
      // 스프링 컨트롤러 에서  @CrossOrigin(origins = "*") 또는 corsConfig
      final response = await dio.post("http://192.168.40.185:8080/api/goods" , data : obj );
      final data = response.data; print( data );
      // (1) 저장 성공된 자료를 추가하여 재렌더링 또는 (2) goodAll 재호출
      goodsAll(); // vs // setState(() { goodsList.add( data ); } );
    }catch(e){ print(e); }
  }
  // [4-3] goodsAll 함수 정의
  void goodsAll() async{
    try{
      final dio = Dio();
      final response = await dio.get("http://192.168.40.185:8080/api/goods/list");
      final data = response.data; print( data ); // 통신 결과
      setState( () { goodsList = data;  } ); // 통신 결과를 함수 밖 변수(상태) 업데이트(렌더링)
    }catch(e){ print(e); }
  }
  // [4-4]  initState() 함수 오버라이딩 하여 웨젯의 초기 상태 , useEffect( ()=>{} , [] ) 처럼 위젯이 최초로 열렸을때 1번실행
  @override // 오버라이딩
  void initState() { goodsAll(); } // 현재 위젯이 최초 실행될때 1번 goodAll 함수 실행
  // [4-5] dio로 가져온 데이터를 저장하는 상태 변수
  dynamic goodsList = [];

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

            SizedBox( height: 50 ) ,

            Expanded( child: ListView.builder(
                itemCount: goodsList.length,    // 리스트의 총개수 정의
                itemBuilder: (context , index ) {
                  dynamic goods = goodsList[index]; // index번째 goods 1개 반환
                  // print( goods );
                  return Card( child : ListTile(
                    title: Text( goods['gname'] ), // 객체명['속성명']
                    subtitle: Text( goods['gdesc']),
                  ) );
                } )
            )
          ], // 세로 정렬 웨젯들
        ),
      ),
    );
  }
} 
// Padding : 안쪽 여백
// Column( children : [ 위젯, 위젯 , 위젯 ] ) : 세로 정렬 ,









