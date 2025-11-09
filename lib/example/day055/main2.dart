import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: KakaoMapCurrentLocation(),
  ));
}

class KakaoMapCurrentLocation extends StatefulWidget {
  const KakaoMapCurrentLocation({super.key});

  @override
  State<KakaoMapCurrentLocation> createState() =>
      _KakaoMapCurrentLocationState();
}

class _KakaoMapCurrentLocationState extends State<KakaoMapCurrentLocation> {
  late final WebViewController _controller;
  double? lat;
  double? lng;

  final String kakaoJsKey = '1ac4a57d8a5927d34020a891fcdbbcbd';

  @override
  void initState() {
    super.initState();

    // ✅ 카카오지도 HTML
    final html = '''
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=$kakaoJsKey"></script>
  </head>
  <body style="margin:0;">
    <div id="map" style="width:100%;height:100vh;"></div>
    <script>
      var mapContainer = document.getElementById('map');
      var mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.9780),
        level: 4
      };
      var map = new kakao.maps.Map(mapContainer, mapOption);

      var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(37.5665, 126.9780)
      });
      marker.setMap(map);

      // ✅ Flutter에서 여러 마커 데이터를 받을 함수
      function addMarkers(markerList) {
        var infowindow = new kakao.maps.InfoWindow(); // 하나만 유지
    
        for (var i = 0; i < markerList.length; i++) {
          (function(m) { // 클로저로 i값 고정
            var markerPosition = new kakao.maps.LatLng(m.lat, m.lng);
            var marker = new kakao.maps.Marker({ position: markerPosition });
            marker.setMap(map);
    
            // ✅ 마커 클릭 시 인포윈도우 열기
            kakao.maps.event.addListener(marker, 'click', function() {
              infowindow.setContent('<div style="padding:5px;">' + m.title + '</div>');
              infowindow.open(map, marker);
            });
          })(markerList[i]);
        }
      }
  
      // ✅ 지도 확대 / 축소 함수 추가
      function zoomIn() {
        map.setLevel(map.getLevel() - 1); // 레벨 1 감소 = 확대
      }
      function zoomOut() {
        map.setLevel(map.getLevel() + 1); // 레벨 1 증가 = 축소
      }
  
    </script>
  </body>
</html>
''';

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.dataFromString(html,
          mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));

    // 초기 위치 + 마커 로드
    _initLocation();
  }

  // ✅ 위치 권한 요청 및 현재 위치 가져오기
  Future<void> _initLocation() async {
    if (await Permission.location.request().isGranted) {
      Position pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = pos.latitude;
      lng = pos.longitude;

      // 지도 이동
      _moveToMyLocation();

      // ✅ 서버에서 마커 데이터 가져오기
      await _fetchAndShowMarkers();
    } else {
      await openAppSettings();
    }
  }

  // ✅ Flutter → JS로 지도 중심 이동
  void _moveToMyLocation() {
    if (lat != null && lng != null) {
      final js = '''
        var moveLatLon = new kakao.maps.LatLng($lat, $lng);
        map.panTo(moveLatLon);
        marker.setPosition(moveLatLon);
      ''';
      _controller.runJavaScript(js);
    }
  }

  // ✅ 서버에서 마커 데이터 가져와 JS로 전달
  Future<void> _fetchAndShowMarkers() async {
    try {
      // 샘플 서버 주소 (여기에 본인 API 주소 넣기)
      //final dio = Dio();
      //final response = await dio.get("url");
      // 예시 mocki.io 결과:
      final data = [
        {"lat": 37.4752, "lng": 126.6325, "title": "동인천역"},
        {"lat": 37.4761, "lng": 126.6368, "title": "신포시장"},
        {"lat": 37.4738, "lng": 126.6294, "title": "인천중앙시장"},
        {"lat": 37.4775, "lng": 126.6310, "title": "인천중구청"},
        {"lat": 37.4740, "lng": 126.6355, "title": "차이나타운 입구"},
        {"lat": 37.4725, "lng": 126.6330, "title": "동인천 자유공원"},
        {"lat": 37.4768, "lng": 126.6288, "title": "인천역 광장"},
        {"lat": 37.4783, "lng": 126.6342, "title": "월미공원 가는길"},
        {"lat": 37.4730, "lng": 126.6375, "title": "제물포고등학교 앞"},
        {"lat": 37.4759, "lng": 126.6302, "title": "신포국제시장"}
      ];

      //final data = response.data;
      final jsData = jsonEncode(data);
      final js = "addMarkers($jsData);";
      _controller.runJavaScript(js);
    } catch (e) {
      print("마커 데이터 불러오기 실패: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('동인천역 주변 지도')),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),

          // 오른쪽 하단 확대/축소 버튼
          Positioned(
            right: 10,
            bottom: 100,
            child: Column(
              children: [
                FloatingActionButton.small(
                  heroTag: "zoomIn",
                  onPressed: () => _controller.runJavaScript("zoomIn();"),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.small(
                  heroTag: "zoomOut",
                  onPressed: () => _controller.runJavaScript("zoomOut();"),
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _initLocation,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
