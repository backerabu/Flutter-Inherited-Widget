import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget/inherited_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Widget? title;
  CustomAppBar({this.title,this.actions = const []});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppBarStyle>(
        valueListenable: InheritedColor.of(context).appBarStyle,
        builder: (context, v, _) {
          return AppBar(
            backgroundColor: v.color,
            title: title,
            actions: actions+[IconButton(onPressed: (){
              InheritedColor.of(context).switchColor();
            }, icon: Icon(v.icon))],
          );
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
