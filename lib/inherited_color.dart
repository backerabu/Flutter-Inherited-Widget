import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InheritedColor extends InheritedWidget {
  ValueNotifier<AppBarStyle> appBarStyle;

  void switchColor() {
    if (appBarStyle.value.n == 0) {
      appBarStyle.value = AppBarStyle.night;
    } else {
      appBarStyle.value = AppBarStyle.day;
    }
  }

  InheritedColor(this.appBarStyle, {super.key, required super.child});
  @override
  bool updateShouldNotify(covariant InheritedColor oldWidget) {
    return appBarStyle != oldWidget.appBarStyle;
  }

  static InheritedColor of(BuildContext context) {
    InheritedColor? inheritedColor =
        context.dependOnInheritedWidgetOfExactType<InheritedColor>();
    if (inheritedColor == null) {
      throw FlutterError("Inherited widget is not in the tree");
    }
    return inheritedColor;
  }
}

enum AppBarStyle {
  day(0, Icons.sunny, Colors.amber),
  night(1, Icons.nightlight, Colors.brown);

  const AppBarStyle(this.n, this.icon, this.color);
  final IconData icon;
  final Color color;
  final int n;
}
