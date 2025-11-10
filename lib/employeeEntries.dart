import 'package:project1/project1.dart';
import 'dart:io';
import 'package:project1/Employee.dart';
import 'package:project1/viewManager.dart';


/* ○ Ask the user for the number of employees to add.
○ Loop to collect data for each employee.
○ Try to create an Employee object for each input; catch and print errors without
stopping.
○ After input, print all valid employees’ info.
*/

void enterEmployees(){
  int numberOfEmployees;
  while(true){
    try{
  print("please enter the number of employee you want to add");
   numberOfEmployees = int.parse(stdin.readLineSync()!);}
  catch(e){
    print("'ivalid input' please enter a number");
    continue;
  }
  for(int i = 0 ; i<numberOfEmployees;i++){

    try{

    print("employee number ${i+1}\n");
    print("please enter his name:");
    String name = stdin.readLineSync()!;
    print("please enter his age");
    int age = int.parse(stdin.readLineSync()!);
    print("please enter his position");
    String position = stdin.readLineSync()!;
    print("please enter his monhtly salary");
    double monhtlySalary = double.parse(stdin.readLineSync()!);

    Employee newEmployee = Employee.withPosition(name, age,position,monhtlySalary);

    listOfEmployee.add(newEmployee);
    }catch(e){
      print(e);
    }
  }


  break;
  }
    print("=== All Valid Employees ===");
    view();


}



