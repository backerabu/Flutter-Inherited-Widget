import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget/inherited_color.dart';
import 'package:flutter_inherited_widget/inherited_counter.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedColor(
      ValueNotifier(AppBarStyle.day),
      child: InheritedCounter(
        ValueNotifier(400),
        child: 
        MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page')),
      ),
    );
  }
}

