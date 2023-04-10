import 'package:flutter/material.dart';
import 'package:sportify/king_of_the_court/presentation/components/counter_button.dart';

class KingOfTheCourtScreen extends StatefulWidget {
  const KingOfTheCourtScreen({super.key});

  @override
  State<KingOfTheCourtScreen> createState() => _KingOfTheCourtScreenState();
}

class _KingOfTheCourtScreenState extends State<KingOfTheCourtScreen> {
  final List<CounterButtonInfo> _buttonInfoList = [
    const CounterButtonInfo('Double One', Colors.blue, 0),
    const CounterButtonInfo('Double Two', Colors.green, 0),
    const CounterButtonInfo('Double Three', Colors.red, 0),
    const CounterButtonInfo('Double Four', Colors.purple, 0),
  ];

  List<CounterAction> _counterActions = [];
  List<CounterButtonInfo> _counters = [];

  void _handleCounterChanged(CounterButton counterButton) {
    setState(() {
      _counters = _counters.map((counter) {
        if (counter.label == counterButton.label) {
          return CounterButtonInfo(
              counter.label, counter.color, counter.count + 1);
        }
        return counter;
      }).toList();
    });
  }

  void _onResetCounters() {
    setState(() {
      _counters = _buttonInfoList;
    });
  }

  @override
  void initState() {
    super.initState();
    _counters = _buttonInfoList;
    _counterActions = [
      const CounterAction('Undo', null),
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
            color: buttonInfo.color,
            label: buttonInfo.label,
            count: buttonInfo.count,
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

class CounterButtonInfo {
  final String label;
  final Color color;
  final int count;

  const CounterButtonInfo(this.label, this.color, this.count);
}

class CounterAction {
  final String label;
  final VoidCallback? onPressed;

  const CounterAction(this.label, this.onPressed);
}
