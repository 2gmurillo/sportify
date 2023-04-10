import 'package:sportify/king_of_the_court/domain/counter_button_info.dart';

abstract class CounterManager {
  List<CounterButtonInfo> getInitialCounters();
  List<CounterButtonInfo> updateCounter(
      List<CounterButtonInfo> counters, CounterButtonInfo counterToUpdate);
  List<CounterButtonInfo> resetCounters();
}
