import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget/second_page.dart';

import 'custom_appbar.dart';
import 'inherited_counter.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (b) => const SecondPage()));
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            //Display counter value from inherited widget
            ValueListenableBuilder<int>(
                valueListenable: InheritedCounter.of(context).count,
                builder: (context, v, _) {
                  return Text(
                    v.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Call increment function from inherited counter
          InheritedCounter.of(context).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
