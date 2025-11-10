//class to handel the errors of the inputs of the employees
class EmployeeException implements Exception {
  String msg;
  EmployeeException(this.msg);

  @override
  String toString() {
    
    return 'EmployeeException: $msg';
  }
}