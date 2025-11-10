import 'package:project1/project1.dart';
import 'package:project1/Employee.dart';
import 'dart:io';
import 'dart:convert';


/* 
Save and load employees to/from a JSON file to persist data across program runs.
*/

void json(){
//selector 1 to save the list in json 2 to load the list from json
print("please select\n(1) to save\n(2) to load");
String select = stdin.readLineSync()!;

  switch (select){
    case '1':
    save();
    case '2':
    loader();
    default:
    print("invalid input");
  }

}

void save() async{
//fully handeled save for the list 

  String jsonEncoded = jsonEncode(listOfEmployee);
  File json = File("employee.json");
  //if the file exsists ask the user append to it or overwrite it 
  if (json.existsSync()) {

    print("the file exist do you want to overwrite it ?\nor add to it\n(1) to overwrite\n(2) to append to it");
    String select = stdin.readLineSync()!;
    switch (select){
      case '1':
        json.writeAsStringSync(jsonEncoded);
      case '2':
        // load then rewrite it in full 
        addToList();
        jsonEncoded = jsonEncode(listOfEmployee);
        json.writeAsStringSync(jsonEncoded);

    }
  }
  //if not will create the file and write on it 
  else{
    json.create();
    json.writeAsString(jsonEncoded);
  }



}


//function used to add to the list in loader
void addToList(){
        var temp = load();
        temp.forEach((e) {listOfEmployee.add(e);});
}
//load manager
void loader (){
  //if the list has elements it ask the user to overwrites it or append to it 
  if(listOfEmployee.length>0){
    print("there is employees on the list do you want to overwrite it ?\n(1) to overwrite\n(2) to add them to the list");
    String select = stdin.readLineSync()!;

    switch (select){
      case '1':
      break;
      case '2':
      addToList();
        return;
    }

  }
  listOfEmployee = load();
}

//load and return list of employee from json file 
List<Employee> load(){
      File file = File('employee.json');
      if (file.existsSync()){
      String str = file.readAsLinesSync()[0];
      List<dynamic> temp = jsonDecode(str);
      List<Employee> emp = temp.map((e)  {

       return  Employee.fromJson(e);
      }).toList();
      return emp;
      }
  print ("there is no file to load");

  return [];

      
}


