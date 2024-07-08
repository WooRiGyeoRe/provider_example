import 'package:flutter/material.dart';
import 'package:flutter_provider_example/providers/counts.dart';
import 'package:flutter_provider_example/widgets/counter.dart';
import 'package:provider/provider.dart'; // 생성한 전역 상태를 사용하기 위해 flutter_proivder 패키지와 상태 클래스를 import해서 불러옴
import 'package:provider_example/providers/counts.dart';
import 'package:provider_example/widgets/buttons.dart';
import 'package:provider_example/widgets/counter.dart';

// 생성한 전역 상태를 사용할 위젯들의 공통 부모 위젯에 Provider를 제공해보자!

void main() {
  runApp(
    MultiProvider(
      // 최상단 위젯에 Provider를 제공
      // 보통 하나의 앱을 개발할 때, 하나 이상의 Provider를 사용! -> 이번 예제에서는 MultiProvider를 사용해 여러 Provider를 제공해보자~
      // providers 리스트를 정의해 여러 상태 관리 객체를 제공할 수 있음
      providers: [
        // ChangeNotifierProvider => Flutter의 provider 패키지에서 제공하는 클래스
        // ChangeNotifier를 상속받은 객체를 상태로 관리하고 이를 위젯 트리에 제공하는 역할을 함
        // ChangeNotifier를 상속받은 클래스는 상태가 변경될 때 notifyListeners 메서드를 호출해 이를 듣고 있는 위젯들에게 알림!
        ChangeNotifierProvider(create: (_) => Counts()),
        // create 속성 => ChangeNotifierProvider가 관리할 객체를 생성하는 함수로 Counts라는 클래스를 인스턴스화
        // _ 는 함수의 매개변수! BuildContext를 받지만, 사용되지 않는다는 것을 나타내려고 언더바 사용
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => Counts(),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Counter(),
              //Buttons(),
            ],
          ),
        ),
      ),
    );
  }
}
