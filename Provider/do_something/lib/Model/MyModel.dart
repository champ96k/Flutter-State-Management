import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class MyModel extends ChangeNotifier {
  var a = 24, b = 120, c = 250, d = 0.5;
  Color color = Colors.red;

  var random = Random();

  void doSomething() {
    color = Color.fromRGBO(random.nextInt(100), random.nextInt(200),
        random.nextInt(250), 0.8); 
    debugPrint("myModel Call: $color ");
    notifyListeners();
  }
}
