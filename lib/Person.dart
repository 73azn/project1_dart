
/*
Define a base class Person with name (String) and age (int) properties, a constructor,
and a displayInfo() method.
*/
class Person{
String name;
int age;
Person(this.name,this.age);

void displayInfo(){
  print("""

Name: $name
Age: $age""");
}
}