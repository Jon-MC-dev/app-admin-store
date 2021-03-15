import 'package:flutter/material.dart';
import 'package:app4/src/widgets/menu_controller.dart';

void main() {
  //ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MenuWidget(),
    );
  }
}
