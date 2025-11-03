// -----------------------------
// [5] 클래스 / 객체 (OOP 핵심)
// -----------------------------
// 클래스 정의
class Person {
  // 멤버 변수
  String name;
  int age;

  // 생성자
  Person(this.name, this.age);

  // 메서드
  void introduce() {
    print("안녕하세요, 저는 $name이고 나이는 $age살입니다.");
  }
}
// -----------------------------
// [6] 상속 / 오버라이드
// -----------------------------
class Student extends Person {
  String major;
  Student(String name, int age, this.major) : super(name, age);

  @override
  void introduce() {
    print("저는 $major 전공의 학생 $name입니다. 나이는 $age살이에요.");
  }
}

void main() {

  // -----------------------------
  // [1] 기본 타입 (기초 자료형)
  // -----------------------------
  int age = 25;                 // 정수형
  double height = 175.5;        // 실수형
  String name = "유재석";        // 문자열
  bool isStudent = false;       // 논리형

  print("이름: ${name}, 나이: $age, 키: $height, 학생여부: $isStudent");

  // -----------------------------
  // [2] var / dynamic / const / final
  // -----------------------------
  var city = "서울";              // 자동 타입 추론
  dynamic variable = 123;        // 타입 변경 가능
  variable = "변경된 문자열";      // OK
  final country = "대한민국";     // 실행 중 변경 불가 (상수)
  const PI = 3.14159;            // 컴파일 상수

  print("도시: $city, 국가: $country, PI: $PI, 변수: $variable");

  // -----------------------------
  // [3] List / Map / Set (컬렉션)
  // -----------------------------
  List<String> fruits = ["사과", "바나나", "포도"];
  fruits.add("딸기");
  print("과일목록: $fruits / 첫 번째 과일: ${fruits[0]}");

  Map<String, int> scores = {"국어": 90, "영어": 85, "수학": 95};
  print("수학 점수: ${scores["수학"]}");

  Set<int> uniqueNumbers = {1, 2, 3, 3, 2};
  print("중복 제거된 집합: $uniqueNumbers");

  // -----------------------------
  // [4] 함수(Function)
  // -----------------------------
  int add(int a, int b) {
    return a + b;
  }

  print("10 + 20 = ${add(10, 20)}");

  // 화살표 함수(람다)
  String greeting(String name) => "안녕하세요, $name님!";
  print(greeting("단자"));


  // ✅ 익명 함수(Anonymous Function) 예제
  // 함수 이름이 없는 함수, 변수에 저장하거나 콜백으로 전달 가능
  var sayHello = () {
    print("익명함수 실행: 안녕하세요 👋");
  };

  // 실행
  sayHello();

  // 매개변수가 있는 익명 함수
  var multiply = (int x, int y) {
    return x * y;
  };

  print("5 * 6 = ${multiply(5, 6)}");


  // -----------------------------
  // [5] 클래스 / 객체 사용
  // -----------------------------
  Person p1 = Person("홍길동", 30);
  p1.introduce();

  Student s1 = Student("이수근", 25, "컴퓨터공학");
  s1.introduce();

  // -----------------------------
  // [7] Null Safety (널 안정성)
  // -----------------------------
  String? nickname; // ? : null 허용
  nickname = null;
  print("닉네임: ${nickname ?? '미정'}"); // null이면 기본값 출력
}
