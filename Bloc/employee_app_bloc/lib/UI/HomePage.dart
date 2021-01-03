import 'package:flutter/material.dart';
import 'package:employee_app_bloc/Bloc/EmployeeBloc.dart';
import 'package:employee_app_bloc/Model/Employee.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final EmployeeBloc _employeeBloc = EmployeeBloc();
  
  bool _isDisposed = false;
  @override
  void dispose() {
    _employeeBloc.dispose();
    super.dispose();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Employee"),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
            stream: _employeeBloc.employeeListStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
              return (snapshot == null || snapshot.hasError)
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "${snapshot.data[index].id}.",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "${snapshot.data[index].name}",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "₹ ${snapshot.data[index].salary}",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    icon: Icon(Icons.thumb_up,
                                        color: Colors.green),
                                    onPressed: () {
                                      debugPrint("Inside Increment Button");
                                      _employeeBloc.employeeSalryIncrement
                                          .add(snapshot.data[index]);
                                    }),
                              ),
                              Container(
                                child: IconButton(
                                    icon: Icon(
                                      Icons.thumb_down,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      debugPrint("Inside Decrement Button");
                                      _employeeBloc.employeeSalryDecrement
                                          .add(snapshot.data[index]);
                                    }),
                              )
                            ],
                          ),
                        );
                      },
                    );
            }),
      ),
    );
  }
}
