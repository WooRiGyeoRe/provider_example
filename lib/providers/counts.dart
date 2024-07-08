import 'package:flutter/material.dart';

// Provider => 전역 데이터를 관리를 돕는 라이브러리

// Provider를 사용하려면 ---> 반드시 with ChangeNotifier 사용해 class를 생성해야 함!
// ChangeNotifier => 상태가 변경될 때마다 해당 변경 사항을 알리고 UI를 업데이트함!
class Counts with ChangeNotifier {
  // 앱 내에서 공유할 상태 변수 선언
  int _count = 0;
  int get count => _count; // 해당 변수를 외부에서 접근할 수 있도록 getter 생성

  // 해당 상태 변수를 변경하는 함수 생성
  // add함수 => 값 증가
  void add() {
    _count++;
    notifyListeners();
    // 변수를 수정했다면? --->  (★중요) notifyListeners()를 실행해 데이터가 갱신됨을 알려줌!
    // Stateful Widget에서 값이 변경되었음을 알리기 위해 setState 함수를 사용하는 것과 동일한 원리
    // notifyListeners()를 실행하지 않으면? => 다른 위젯들에서 해당 값이 변경되었는지 인식하지 못함
  }

  // remove 함수 => 값 감소
  void remove() {
    _count--;
    notifyListeners();
  }
}


// Provider를 사용하여 앱 전체에서 사용될 전역 상태 생성 완료! 