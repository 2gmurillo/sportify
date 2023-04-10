import 'package:sportify/king_of_the_court/domain/counter_button_info.dart';

abstract class CounterRepository {
  List<CounterButtonInfo> getCounters();
}
