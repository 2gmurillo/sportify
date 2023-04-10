import 'package:flutter/material.dart';
import 'package:sportify/king_of_the_court/domain/counter_button_info.dart';
import 'package:sportify/king_of_the_court/infrastructure/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  @override
  List<CounterButtonInfo> getCounters() {
    return [
      const CounterButtonInfo('Double One', Colors.blue, 0),
      const CounterButtonInfo('Double Two', Colors.green, 0),
      const CounterButtonInfo('Double Three', Colors.red, 0),
      const CounterButtonInfo('Double Four', Colors.purple, 0),
    ];
  }
}
