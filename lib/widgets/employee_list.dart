import 'package:flutter/material.dart';
import '../../../services/employee_service.dart';

class EmployeeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final employees = EmployeeService.getEmployees();

    return employees.isEmpty
        ? Center(child: Text('No employees added yet.'))
        : ListView.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) {
        final emp = employees[index];
        return ListTile(
          title: Text(emp.name),
          subtitle: Text('${emp.email} - ${emp.position}'),
        );
      },
    );
  }
}