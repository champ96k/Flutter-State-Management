/*
    1.Import
    2.List of Employee
    3.Stream Controller
    4.Stream Sink Getter
    5.Constructor
      - add Data
      - Listen to changes
    6.Core Fucntion
    7.dispose
*/

//  1) Import
import 'dart:async';
import 'package:employee_app_bloc/Model/Employee.dart';

//  2) List of Employees
class EmployeeBloc {
  List<Employee> _employeelist = [
    Employee(1, "Employe One", 1000.52),
    Employee(2, "Employe Two", 2000.0),
    Employee(3, "Employe Three", 30000.0),
    Employee(4, "Employe Four", 4000.0),
    Employee(5, "Employe Five", 5000.0),
  ];

//  3. Stream Controller
//      Sink - input
//      Stream - Output

  final _employeeListStreamController = StreamController<List<Employee>>();

  //for increment and decrement
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

//  4.Getter

  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalryIncrement =>
      _employeeSalaryIncrementStreamController.sink;

  StreamSink<Employee> get employeeSalryDecrement =>
      _employeeSalaryDecrementStreamController.sink;

//  .Constructor

  EmployeeBloc() {
    // Add data
    _employeeListStreamController.add(_employeelist);
    // Listen to changes
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  //Core Fucntion
  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementSalary = salary * 20/100;

    _employeelist[employee.id - 1].salary = salary + incrementSalary;
    employeeListSink.add(_employeelist);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementSalary = salary * 20/100;

    _employeelist[employee.id - 1].salary = salary - decrementSalary;
    employeeListSink.add(_employeelist);
  }

  void dispose() {
    _employeeListStreamController?.close();
    _employeeSalaryDecrementStreamController.close();
    _employeeSalaryIncrementStreamController.close();
  }

 
}
 