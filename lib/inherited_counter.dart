import 'package:flutter/widgets.dart';

class InheritedCounter extends InheritedWidget{
  final int count;
  
  const InheritedCounter(this.count, {super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedCounter oldWidget) {
    return count!=oldWidget.count;
  }

  static InheritedCounter? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<InheritedCounter>();
  }

}