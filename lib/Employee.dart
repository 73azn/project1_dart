import 'package:project1/EmployeeException.dart';
import 'package:project1/Person.dart';


/*
Define a subclass Employee that extends Person and adds position (String) and
monthlySalary (double).
○ Use a named constructor Employee.withPosition with named parameters.
○ Validate inside the constructor:
■ age must be ≥ 18.
■ name and position cannot be empty or whitespace.
■ monthlySalary must be > 0.
○ Throw exceptions if validation fails.
○ Override displayInfo() to print all employee details including yearly salary
calculation. 
*/

class Employee extends Person{
  String? position;
  double? monthlySalary;
  Employee(super.name,super.age);
  Employee.withPosition(String name,int age,String position,double monthlySalary):super(name,age){
    String errors = '';
    if(name.trim() == "") errors+="\nThe name are blank\n";
    if(age<18) errors+="Ileagel age to be employee he should be 18 or more\n";
    if(position.trim()=="") errors+="The position are blank\n";
    if(monthlySalary<=0) errors+="The salary should be more than 0\n";
    if(errors.isNotEmpty) throw EmployeeException(errors);

    super.name = name;
    super.age = age;
    this.position = position;
    this.monthlySalary = monthlySalary;
  }

@override
  void displayInfo() {
    print("--- Employee info ---");
    super.displayInfo();
    print("""
Position: $position
Monthly salary \$$monthlySalary
Yearly salary: \$${monthlySalary!*12}
""");
  }

//this will be used in jsonManager for jsonEncode  
Map toJson(){
  return {
    'name':this.name,
    'age':this.age,
    'position':this.position,
    'monthlySalary':this.monthlySalary
  };
}

//this will be used to decode the JSON file
static Employee fromJson(Map json){
  return Employee.withPosition(json['name'], json['age'], json['position'], json['monthlySalary']);
}
}