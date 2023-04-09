import 'package:flutter/material.dart';
import 'package:sportify/king_of_the_court/presentation/components/counter_button_wrapper.dart';

class KingOfTheCourtScreen extends StatelessWidget {
  KingOfTheCourtScreen({super.key});

  final List<CounterAction> _counterActions = [
    const CounterAction('Undo', null),
    const CounterAction('Reset', null),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('King of the Court'),
      ),
      body: Center(
        child: CounterButtonWrapper(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _counterActions.map((action) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                onPressed: action.onPressed,
                child: Text(action.label),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CounterAction {
  final String label;
  final VoidCallback? onPressed;

  const CounterAction(this.label, this.onPressed);
}
