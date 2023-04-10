import 'package:flutter/material.dart';
import 'package:sportify/king_of_the_court/domain/counter_button_info.dart';

class CounterButton extends StatefulWidget {
  final CounterButtonInfo counter;
  final Function(CounterButtonInfo) onCounterChanged;

  const CounterButton(
      {super.key, required this.counter, required this.onCounterChanged});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  void _increment() {
    setState(() {
      widget.onCounterChanged(widget.counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _increment,
      child: Container(
        decoration: BoxDecoration(
          color: widget.counter.color,
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.counter.label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              widget.counter.count.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
