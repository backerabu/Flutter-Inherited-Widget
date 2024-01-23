import 'package:flutter/widgets.dart';

class InheritedCounter extends InheritedWidget {
  final ValueNotifier<int> count;

  const InheritedCounter(this.count, {super.key, required super.child});

  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }

  @override
  bool updateShouldNotify(covariant InheritedCounter oldWidget) {
    return count != oldWidget.count;
  }

  static InheritedCounter of(BuildContext context) {
    final inheritedCounter =  context.dependOnInheritedWidgetOfExactType<InheritedCounter>();
    if(inheritedCounter ==null){
      throw FlutterError("InheritedCounter.of() called in a context which does not containe InheritedCounter");
    }
    return inheritedCounter;
  }
}
