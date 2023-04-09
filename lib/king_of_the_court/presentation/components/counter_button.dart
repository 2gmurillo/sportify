import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final Color color;
  final String label;

  const CounterButton({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
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
              '$_counter',
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
