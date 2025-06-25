import 'package:flutter/material.dart';
import '../model/employee.dart';
import '../services/employee_service.dart';
import '../models/employee.dart';

class AddEmployeeScreen extends StatefulWidget {
  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _positionController = TextEditingController();
  final _emailController = TextEditingController();
  final EmployeeService _employeeService = EmployeeService();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Employee newEmployee = Employee(
        id: DateTime.now().toString(),
        name: _nameController.text,
        position: _positionController.text,
        email: _emailController.text, designation: '', age:0,
      );
      _employeeService.addEmployee(newEmployee).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Employee added successfully')));
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Employee")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(controller: _nameController, decoration: InputDecoration(labelText: 'Name'), validator: (value) => value!.isEmpty ? 'Enter name' : null),
              TextFormField(controller: _positionController, decoration: InputDecoration(labelText: 'Position'), validator: (value) => value!.isEmpty ? 'Enter position' : null),
              TextFormField(controller: _emailController, decoration: InputDecoration(labelText: 'Email'), validator: (value) => value!.isEmpty ? 'Enter email' : null),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _submitForm, child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
