//  Objective
/*      1) Variable
        2) Constructor
        3) Custom Setter
        4) Custom Getter
*/
class Employee {
  //instance Varible Declaration
  int _id;
  String _name;
  double _salary;

  //Constructor
  Employee(this._id, this._name, this._salary);

  //Custom Setter
  set id(int id) {
    this._id = id;
  }

  set name(String name) {
    this._name = name;
  }

  set salary(double salary) {
    this._salary = salary;
  }

  // Custom Getter
  int get id => this._id;
  String get name => this._name;
  double get salary => this._salary;

  /* alternate way to write custom getter
    int get id {
      return  this._id;
    }
  */

}
