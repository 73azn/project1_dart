import 'dart:io';
import 'dart:math';

import 'package:project1/project1.dart';

void viewer(){
bool run = true;
while(run){
  //selector 1 for viewing the employee 2 for sorting employees 3 for filttering 4 to back to the main menu
  print("please select\n(1) view employees\n(2) sort employees\n(3) filtter employees\n(4) back to the main-menu");
  String select = stdin.readLineSync()!;
  switch(select){
    case '1':
    view();
    case '2':
    sort();
    case '3':
    filtter();
    case '4':
      run = false;
  }
}
}

/*
Add sorting feature: Allow the user to sort employees by age, name, or salary before
printing the report.
 */
void sort(){
  print("please select\n(1) sort by age\n(2) sort by name\n(3) sort by salary\n\tnote: the main list will be edited");
  String select = stdin.readLineSync()!;
  print("(1) for ascendent \t (any) for descendent");
  String decAec = stdin.readLineSync()!;
  switch(select){
    case'1':
    listOfEmployee.sort((a,b) => decAec=='1'?min(a.age, b.age):max(a.age, b.age));
    case'2':
    listOfEmployee.sort((a,b) => decAec=='1'?min(a.name.codeUnits[0], b.name.codeUnits[0]):max(a.name.codeUnits[0], b.name.codeUnits[0]));
    case'3':
    listOfEmployee.sort((a,b) => decAec=='1'?min(a.monthlySalary!.round(), b.monthlySalary!.round()):max(a.monthlySalary!.round(), b.monthlySalary!.round()));
    
    default:print("invalid input");
  }
  
}

/*
Add filtering feature: Allow filtering employees by position or salary range when
displaying the report.
*/

void filtter(){
  print("please select\n(1) to filtter positions\n(any) salary range\n\tnote: it only display the filtred dosn't edit the main list");
  String select = stdin.readLineSync()!;
  switch(select){
    case'1':
    print("please enter the positon you want to see");
      String position = stdin.readLineSync()!;
      listOfEmployee.forEach((e){
        if(e.position!.toLowerCase() == position.toLowerCase()){
          e.displayInfo();
        }
      });
    default:
    print("please enter the min");
    double minR = double.parse(stdin.readLineSync()!);
    print("please enter the max");
    double maxR = double.parse(stdin.readLineSync()!);
    listOfEmployee.forEach((e){
      if(e.monthlySalary!.clamp(minR, maxR)==e.monthlySalary){
        e.displayInfo();
        }
    });    


  }
}



// simply view each employee if no employee exsits print nothing to see
void view(){
  if(listOfEmployee.isEmpty) print("nothing to see");

listOfEmployee.forEach((emp) {

  emp.displayInfo();
});
}
