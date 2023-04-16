import 'package:sportify/king_of_the_court/application/counter_action_manager.dart';
import 'package:sportify/king_of_the_court/domain/counter_button_info.dart';
import 'package:sportify/king_of_the_court/domain/counter_button_action.dart';

class CounterActionManagerImpl implements CounterActionManager {
  @override
  List<CounterAction> getInitialCounterActions() {
    return [
      const CounterAction('Reset', null),
      const CounterAction('Undo', null),
    ];
  }

  @override
  List<CounterAction> increment(
      Function() onResetCounters, Function() undoLastAction) {
    return [
      CounterAction('Reset', onResetCounters),
      CounterAction('Undo', undoLastAction),
    ];
  }

  @override
  List<CounterAction> reset() {
    return [
      const CounterAction('Reset', null),
      const CounterAction('Undo', null),
    ];
  }

  @override
  List<CounterAction> undo(List<CounterButtonInfo> counters,
      Function() onResetCounters, Function() undoLastAction) {
    bool canPerformAction = counters.any((counter) => counter.count > 0);

    return [
      CounterAction('Reset', canPerformAction ? onResetCounters : null),
      CounterAction('Undo', canPerformAction ? undoLastAction : null),
    ];
  }
}
