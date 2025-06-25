// import 'package:flutter/material.dart';
// import '../../../services/employee_service.dart';
// import '../../../models/employee.dart';
//
// class AddEmployeeForm extends StatefulWidget {
//   final VoidCallback onEmployeeAdded;
//   AddEmployeeForm({required this.onEmployeeAdded});
//
//   @override
//   _AddEmployeeFormState createState() => _AddEmployeeFormState();
// }
//
// class _AddEmployeeFormState extends State<AddEmployeeForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _name = TextEditingController();
//   final _email = TextEditingController();
//   final _position = TextEditingController();
//
//   void _submit() {
//     if (_formKey.currentState!.validate()) {
//       var addEmployee = EmployeeService.addEmployee(Employee(
//         name: _name.text,
//         email: _email.text,
//         position: _position.text, id:'',
//       ));
//       widget.onEmployeeAdded();
//       _name.clear();
//       _email.clear();
//       _position.clear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextFormField(controller: _name, decoration: InputDecoration(labelText: 'Name')),
//             TextFormField(controller: _email, decoration: InputDecoration(labelText: 'Email')),
//             TextFormField(controller: _position, decoration: InputDecoration(labelText: 'Position')),
//             SizedBox(height: 10),
//             ElevatedButton(onPressed: _submit, child: Text('Add Employee')),
//           ],
//         ),
//       ),
//     );
//   }
// }