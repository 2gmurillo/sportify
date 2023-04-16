import 'package:flutter/material.dart';
import 'package:sportify/king_of_the_court/application/counter_manager.dart';
import 'package:sportify/king_of_the_court/application/counter_manager_impl.dart';
import 'package:sportify/king_of_the_court/domain/counter_button_action.dart';
import 'package:sportify/king_of_the_court/domain/counter_button_info.dart';
import 'package:sportify/king_of_the_court/presentation/components/counter_button.dart';

class KingOfTheCourtScreen extends StatefulWidget {
  const KingOfTheCourtScreen({super.key});

  @override
  State<KingOfTheCourtScreen> createState() => _KingOfTheCourtScreenState();
}

class _KingOfTheCourtScreenState extends State<KingOfTheCourtScreen> {
  final CounterManager _counterManager = CounterManagerImpl();
  List<CounterButtonInfo> _counters = [];
  List<CounterAction> _counterActions = [];

  void _handleCounterChanged(CounterButtonInfo counter) {
    setState(() {
      _counters = _counterManager.increment(_counters, counter);
    });
  }

  void _onResetCounters() {
    setState(() {
      _counters = _counterManager.reset();
    });
  }

  void _undoLastAction() {
    setState(() {
      _counters = _counterManager.undo(_counters);
    });
  }

  @override
  void initState() {
    super.initState();
    _counters = _counterManager.getInitialCounters();
    _counterActions = [
      CounterAction('Undo', _undoLastAction),
      CounterAction('Reset', _onResetCounters),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('King of the Court'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: _counters.map((buttonInfo) {
          return CounterButton(
            counter: buttonInfo,
            onCounterChanged: _handleCounterChanged,
          );
        }).toList(),
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
