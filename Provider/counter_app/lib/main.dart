import 'package:counter_app/Model/counter.dart';
import 'package:counter_app/Screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Counter(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
