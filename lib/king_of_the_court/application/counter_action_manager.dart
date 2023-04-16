import 'package:sportify/king_of_the_court/domain/counter_button_action.dart';
import 'package:sportify/king_of_the_court/domain/counter_button_info.dart';

abstract class CounterActionManager {
  List<CounterAction> getInitialCounterActions();
  List<CounterAction> increment(
      Function() onResetCounters, Function() undoLastAction);
  List<CounterAction> reset();
  List<CounterAction> undo(List<CounterButtonInfo> counters,
      Function() onResetCounters, Function() undoLastAction);
}
