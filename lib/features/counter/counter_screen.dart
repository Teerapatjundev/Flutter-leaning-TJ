import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_flutter_app/core/stores/counter_store.dart';

class CounterScreen extends StatelessWidget {
  final CounterStore counterStore;

  const CounterScreen({Key? key, required this.counterStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void editCounter(
      BuildContext context,
      int id,
      int currentValue,
      CounterStore provider,
    ) {
      TextEditingController controller = TextEditingController(
        text: currentValue.toString(),
      );

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Edit Counter'),
            content: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  int newValue = int.tryParse(controller.text) ?? currentValue;
                  provider.updateCounter(id, newValue);
                  Navigator.pop(context);
                },
                child: const Text('Save Changes'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Saved Counters')),
      body: Observer(
        builder: (_) {
          return counterStore.savedCounters.isEmpty
              ? const Center(child: Text("No saved counters yet!"))
              : ListView.builder(
                itemCount: counterStore.savedCounters.length,
                itemBuilder: (context, index) {
                  final counterData = counterStore.savedCounters[index];
                  final counterId = counterData['id'];
                  final counterValue = counterData['value'];

                  return ListTile(
                    title: Text('Counter: $counterValue'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed:
                              () => editCounter(
                                context,
                                counterId,
                                counterValue,
                                counterStore,
                              ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            counterStore.deleteCounter(counterId);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
        },
      ),
    );
  }
}
