import 'package:counter_app/Constants/constants.dart';
import 'package:counter_app/Model/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    debugPrint("****** Build Method Call *******");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.appTitle,
          // style: theme.headline,
        ),
      ),
      body: Center(
        child: Consumer<Counter>(
          builder: (context, counter, child) => Text(
            "${counter.value}",
            style: theme.headline1,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var counter = context.read<Counter>();
          counter.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
