import 'package:flutter/material.dart';
import 'package:sportify/king_of_the_court/presentation/components/counter_button.dart';

class CounterButtonWrapper extends StatelessWidget {
  CounterButtonWrapper({super.key});

  final List<CounterButtonInfo> _buttonInfoList = [
    const CounterButtonInfo('Double One', Colors.blue),
    const CounterButtonInfo('Double Two', Colors.green),
    const CounterButtonInfo('Double Three', Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: _buttonInfoList.map((buttonInfo) {
        return CounterButton(
          color: buttonInfo.color,
          label: buttonInfo.label,
        );
      }).toList(),
    );
  }
}

class CounterButtonInfo {
  final String label;
  final Color color;

  const CounterButtonInfo(this.label, this.color);
}
