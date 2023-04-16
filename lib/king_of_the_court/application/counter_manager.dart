import 'package:sportify/king_of_the_court/domain/counter_button_info.dart';

abstract class CounterManager {
  List<CounterButtonInfo> getInitialCounters();
  List<CounterButtonInfo> increment(
      List<CounterButtonInfo> counters, CounterButtonInfo counterToUpdate);
  List<CounterButtonInfo> reset();
  List<CounterButtonInfo> undo(List<CounterButtonInfo> counters);
}
