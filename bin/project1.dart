import 'dart:io';

//packages imports 
import 'package:project1/viewManager.dart';
import 'package:project1/employeeEntries.dart';
import 'package:project1/jsonManager.dart';
void main(List<String> arguments) {
  //to let the code running 
  bool run = true;
  
  while(run){
    try{
  print("""
please select
(1) for creating new employee to add them to the list
(2) to load json / save json from exsiting employees
(3) employee viewer manager
(4) to quit""");
  String select = stdin.readLineSync()!;
  
  switch (select){
    case "1":
      enterEmployees();
      
    case '2':
      json();
    
    case '3':
      viewer();
    case '4':
      run = false;
    default:
    print("invalid input");
     
  }
  
  }catch(e){
    print(e);
  }
  }


}



