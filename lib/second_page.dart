import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget/inherited_counter.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ValueListenableBuilder<int>(
            valueListenable: InheritedCounter.of(context).count,
            builder: (context, v, _) {
              return Text(
                v.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          InheritedCounter.of(context).decrement();
        },
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      ),
    );
  }
}
