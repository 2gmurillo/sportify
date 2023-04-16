import 'package:sportify/king_of_the_court/application/counter_manager.dart';
import 'package:sportify/king_of_the_court/domain/counter_button_info.dart';
import 'package:sportify/king_of_the_court/infrastructure/counter_repository.dart';
import 'package:sportify/king_of_the_court/infrastructure/counter_repository_impl.dart';

class CounterManagerImpl implements CounterManager {
  final CounterRepository _counterRepository = CounterRepositoryImpl();
  final List<String> _counterIds = [];

  @override
  List<CounterButtonInfo> getInitialCounters() {
    return _counterRepository.getCounters();
  }

  @override
  List<CounterButtonInfo> increment(
      List<CounterButtonInfo> counters, CounterButtonInfo counterToUpdate) {
    _counterIds.add(counterToUpdate.label);

    return counters.map((item) {
      if (item.label == counterToUpdate.label) {
        return CounterButtonInfo(item.label, item.color, item.count + 1);
      }
      return item;
    }).toList();
  }

  @override
  List<CounterButtonInfo> reset() {
    _counterIds.clear();

    return _counterRepository.getCounters();
  }

  @override
  List<CounterButtonInfo> undo(List<CounterButtonInfo> counters) {
    if (_counterIds.isEmpty) {
      return counters;
    }

    final String lastItem = _counterIds.removeLast();

    return counters.map((item) {
      if (item.label == lastItem) {
        return CounterButtonInfo(item.label, item.color, item.count - 1);
      }
      return item;
    }).toList();
  }
}
