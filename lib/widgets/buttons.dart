import 'package:flutter/material.dart';
import 'package:flutter_provider_example/providers/counts.dart';
import 'package:provider/provider.dart';

// Provider의 값을 변경하기 위한 Buttons 위젯
class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Buttons 위젯에서 add 또는 remove 함수가 호출되면
        // Provider에서 해당 변수를 변경한 후,
        // notifyListeners() 함수를 호출하여 값이 변경되었음을 알림!
        ElevatedButton(
            onPressed: () {
              // ★ Counter 위젯과 차이점 ★
              // Buttons 위젯에서는 Provider의 count 변경을 위해
              // context.read<Counts>()을 사용해서 add와 remove 함수를 호출함!
              context.read<Counts>().add();
            },
            child: const Icon(Icons.add)),
        const SizedBox(
          width: 40,
        ),
        ElevatedButton(
            onPressed: () {
              context.read<Counts>().remove();
            },
            child: const Icon(Icons.remove))
      ],
    );
  }
}
