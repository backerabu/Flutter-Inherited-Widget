# flutter_inherited_widget

A new Flutter project fr Inherited Widget demo.

## Getting Started

Understanding Inherited Widgets in Flutter
Inherited Widgets in Flutter provide a mechanism to propagate information down the widget tree efficiently. They allow classes that extend them to pass data to their descendants without having to manually pass the data through constructors or other means.

Inherited Widgets work by notifying registered build contexts if there is any change. Therefore, descendant widgets that depend on it will only be rebuilt if necessary. Additionally, these widgets can also access non-private properties of the nearest widget of the same type.

Implementing Inherited Widgets
To use Inherited Widgets, you need to create a class that extends InheritedWidget. This class requires you to override the updateShouldNotify method. This method determines whether the widgets inheriting from this widget should be notified. It returns a boolean and accepts a parameter whose type is the same as the class type.

Here's a simple example of how to create an Inherited Widget:
```
class MyInheritedWidget extends InheritedWidget {
 final String data;

 MyInheritedWidget({this.data, Widget child}) : super(child: child);

 @override
 bool updateShouldNotify(MyInheritedWidget oldWidget) {
    // Notify widgets if data has changed
    return data != oldWidget.data;
 }

 static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
 }
}
```
In this example, MyInheritedWidget is an Inherited Widget that holds a piece of data (data). The updateShouldNotify method checks if the data has changed and if so, it notifies the widgets that depend on it. The of method is a common convention to retrieve the nearest MyInheritedWidget.

Using Inherited Widgets in an App
To use the MyInheritedWidget in an app, you would wrap the part of the widget tree that needs access to the data with MyInheritedWidget:
```
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return MyInheritedWidget(
      data: "Hello",
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: DisplayData(),
          ),
        ),
      ),
    );
 }
}

class DisplayData extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    var myData = MyInheritedWidget.of(context).data;
    return Text(myData);
 }
}
```
In this example, DisplayData widget retrieves the data from MyInheritedWidget and displays it. Whenever the data changes, DisplayData gets rebuilt with the new data.

Remember that Inherited Widgets are best suited for small amounts of data and simple apps. For larger applications, consider using other state management solutions like Provider or Riverpod.
