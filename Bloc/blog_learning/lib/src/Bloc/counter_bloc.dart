import 'dart:async';

enum CounterAction { Increment, Decrement }

class CounterBloc {
  int counter = 0;

  //define a streamController (pipe) -streamController - flow of async flow off data
  // ignore: close_sinks
  final _stateSteamController = StreamController<int>();

  //input - sink
  StreamSink<int> get counterSink => _stateSteamController.sink;

  //output - stream
  Stream<int> get counterStream => _stateSteamController.stream;

  // ignore: close_sinks
  final _eventStreamController = StreamController<CounterAction>();
  //input - Event sink
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;

  //output - Event stream
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  CounterBloc() {
    counter = 0;
    eventStream.listen((event) {
      if (event == CounterAction.Increment) {
        counter++;
      } else if (event == CounterAction.Decrement) {
        counter < 0 ? counter = 0 : counter--;
      }
      counterSink.add(counter);
    });
  }
}
