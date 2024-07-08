import 'package:flutter/material.dart';
import 'package:flutter_provider_example/providers/counts.dart';
import 'package:provider/provider.dart';

// Counter위젯 => Text 위젯을 사용해 화면에 숫자를 표시하는 단순한 위젯임
class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  // build는 Flutter의 위젯을 그릴 때 호출되는 메서드
  // 이 메서드가 반환하는 것 = 화면에 그려질 UI

  // BuildContext => 각 위젯이 어디에 위치하고 그 위젯의 부모가 무엇인지를 나타내는 정보가 포함됨
  // context => BuildContext 타입의 변수. context는 build 메서드의 매개변수로 전달되는 인자!
  //            build 메서드의 매개변수로 전달되고,
  //            이 변수를 통해 위젯 트리에서 위젯의 부모나 다른 위젯의 데이터를 참조할 수 있음
  // 즉, BuildContext context => build 메서드의 매개변수로,
  //                              현재 위젯의 위치 및 부모 위젯의 데이터를 접근하기 위한 정보를 포함
  Widget build(BuildContext context) {
    print('Counter');

    return Text(
      // context.watch<Counts>().count
      // => Provider의 count 값이 변경되는지 감시하고, 변경이 있으면 화면에 변경된 값을 표시
      // 해석하면?
      // => provider 패키지를 사용해 Counts 객체를 구독(watch)하고,
      //    Counts 객체의 상태가 변경될 때마다 build 메서드가 다시 호출
      context.watch<Counts>().count.toString(),
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }
}
