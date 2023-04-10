import 'package:sportify/king_of_the_court/application/counter_manager.dart';
import 'package:sportify/king_of_the_court/domain/counter_button_info.dart';
import 'package:sportify/king_of_the_court/infrastructure/counter_repository.dart';
import 'package:sportify/king_of_the_court/infrastructure/counter_repository_impl.dart';

class CounterManagerImpl implements CounterManager {
  final CounterRepository _counterRepository = CounterRepositoryImpl();

  @override
  List<CounterButtonInfo> getInitialCounters() {
    return _counterRepository.getCounters();
  }

  @override
  List<CounterButtonInfo> updateCounter(
      List<CounterButtonInfo> counters, CounterButtonInfo counterToUpdate) {
    return counters.map((item) {
      if (item.label == counterToUpdate.label) {
        return CounterButtonInfo(item.label, item.color, item.count + 1);
      }
      return item;
    }).toList();
  }

  @override
  List<CounterButtonInfo> resetCounters() {
    return _counterRepository.getCounters();
  }
}
