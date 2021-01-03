import 'package:blog_learning/src/Bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterBloc _counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    debugPrint("Build Method call");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Bloc"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _counterBloc.counterStream,
          initialData: 0, 
          builder: (context, snapshot) {
            return Text("${snapshot.data}",
            style: theme.headline1, 
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counterBloc.eventSink.add(CounterAction.Increment);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
