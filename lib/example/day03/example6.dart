import 'package:dio/dio.dart';

// ✅ Dio 객체 전역 생성
final Dio dio = Dio();

// ✅ GET 요청 함수
void getPost() async {
  try {
    print("🔹 GET 요청 중...");
    final response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
    print("✅ GET 성공:");
    print(response.data);
  } catch (e) {
    print("❌ GET 실패: $e");
  }
}

// ✅ POST 요청 함수
void createPost() async {
  try {
    print("\n🔹 POST 요청 중...");
    final response = await dio.post(
      'https://jsonplaceholder.typicode.com/posts',
      data: {
        'title': 'Dio Function Example',
        'body': 'This is a POST test.',
        'userId': 123,
      },
    );
    print("✅ POST 성공:");
    print(response.data);
  } catch (e) {
    print("❌ POST 실패: $e");
  }
}

// ✅ PUT 요청 함수
void updatePost() async {
  try {
    print("\n🔹 PUT 요청 중...");
    final response = await dio.put(
      'https://jsonplaceholder.typicode.com/posts/1',
      data: {
        'title': 'Updated Title',
        'body': 'This post has been updated.',
        'userId': 123,
      },
    );
    print("✅ PUT 성공:");
    print(response.data);
  } catch (e) {
    print("❌ PUT 실패: $e");
  }
}

// ✅ DELETE 요청 함수
void deletePost() async {
  try {
    print("\n🔹 DELETE 요청 중...");
    final response = await dio.delete('https://jsonplaceholder.typicode.com/posts/1');
    print("✅ DELETE 성공:");
    print(response.data);
  } catch (e) {
    print("❌ DELETE 실패: $e");
  }
}

void main()  {
  print("🚀 Dio 함수 예제 시작\n");

   getPost();
   createPost();
   updatePost();
   deletePost();

  print("\n✅ 모든 요청 완료!");
}
