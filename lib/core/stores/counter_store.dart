import 'package:mobx/mobx.dart';
import 'package:my_flutter_app/core/database/database_helper.dart';

part 'counter_store.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  int count = 0;

  @observable
  ObservableList<Map<String, dynamic>> savedCounters = ObservableList.of([]);

  CounterStore() {
    loadCounter();
  }

  @action
  void increment() {
    count++;
  }

  @action
  void decrement() {
    count--;
  }

  @action
  Future<void> loadCounter() async {
    // count = await DatabaseHelper.fetchLatestCounter();
    final fetchedCounters = await DatabaseHelper.fetchAllCounters();
    savedCounters.clear();
    savedCounters.addAll(fetchedCounters);
  }

  @action
  Future<void> saveCounter() async {
    await DatabaseHelper.insertCounter(count);
    await loadCounter();
  }

  @action
  Future<void> updateCounter(int id, int newValue) async {
    await DatabaseHelper.updateCounter(id, newValue);
    await loadCounter();
  }

  @action
  Future<void> deleteCounter(int id) async {
    await DatabaseHelper.deleteCounter(id);
    savedCounters.removeWhere((counter) => counter['id'] == id);
    // await loadCounter();
  }
}
