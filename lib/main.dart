import 'package:flutter/material.dart';

void main() {
  Test1().updateCounter();
  Test2().printCounter();
}

class MyApp extends StatefulWidget {
  int counter = 0;

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class Test1 {
  void updateCounter() {
    MyApp().counter = 13;
  }
}

class Test2 {
  void printCounter() {
    print(MyApp().counter);
  }
}
