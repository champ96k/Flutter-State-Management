import 'package:do_something/Model/MyModel.dart';
import 'package:do_something/Screen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: MyAppp(),
    )
    );
}

class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}