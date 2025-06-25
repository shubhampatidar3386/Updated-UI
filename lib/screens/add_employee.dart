import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final newEmployee = {
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'position': _positionController.text.trim(),
        'designation': _designationController.text.trim(),
      };

      // TODO: handle submission logic here (e.g., send to provider or API)
      if (kDebugMode) {
        print('Employee added: $newEmployee');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Employee added successfully')),
      );

      _formKey.currentState?.reset();
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Employee')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                label: 'Name',
                controller: _nameController,
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter name' : null,
              ),
              _buildTextField(
                label: 'Email',
                controller: _emailController,
                validator: (value) =>
                value == null || !value.contains('@') ? 'Enter valid email' : null,
              ),
              _buildTextField(
                label: 'Position',
                controller: _positionController,
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter position' : null,
              ),
              _buildTextField(
                label: 'Designation',
                controller: _designationController,
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter designation' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Add Employee'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}