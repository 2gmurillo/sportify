import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final Color color;
  final String label;
  final int count;
  final Function(CounterButton) onCounterChanged;

  const CounterButton(
      {super.key,
      required this.color,
      required this.label,
      required this.count,
      required this.onCounterChanged});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  void _increment() {
    setState(() {
      widget.onCounterChanged(widget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _increment,
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              widget.count.toString(),
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
