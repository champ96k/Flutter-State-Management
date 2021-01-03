import 'package:do_something/Model/MyModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Do Something"),
      ),
      body: Consumer<MyModel>(builder: (context, myModel, child) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: ClipRRect(
                 borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  height: 100,
                  width: 200,
                  color: Colors.green,
                  child: FlatButton(
                    onPressed: () {
                      myModel.doSomething();
                      debugPrint("doSomething Call");
                    },
                    child: Text("Do Something"),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                   child: Container(
                  height: 200, 
                  width: 250,  
                  color: myModel.color,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text("Show Something"),
                  ),
                ),
              ),
            ),
          ],
        ));
      }),
    );
  }
}
