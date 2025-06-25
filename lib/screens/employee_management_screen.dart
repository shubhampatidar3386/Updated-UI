import 'package:flutter/material.dart';

class EmployeeManagementScreen extends StatefulWidget {
  const EmployeeManagementScreen({super.key});

  @override
  State<EmployeeManagementScreen> createState() =>
      _EmployeeManagementScreenState();
}

class _EmployeeManagementScreenState extends State<EmployeeManagementScreen> {
  bool showAddEmployee = true;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _positionController = TextEditingController();
  final _addressController = TextEditingController();

  final List<Map<String, String>> employeeList = [];

  void _addEmployee() {
    setState(() {
      employeeList.add({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'position': _positionController.text,
        'address': _addressController.text,
      });

      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _positionController.clear();
      _addressController.clear();
      showAddEmployee = false;
    });
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    String? hintText,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        hintText: hintText ?? 'Enter $label',
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildAddEmployeeForm() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildTextField(
            label: 'Full Name', icon: Icons.person, controller: _nameController),
        const SizedBox(height: 16),
        _buildTextField(
            label: 'Email', icon: Icons.email, controller: _emailController),
        const SizedBox(height: 16),
        _buildTextField(
            label: 'Phone Number',
            icon: Icons.phone,
            controller: _phoneController),
        const SizedBox(height: 16),
        _buildTextField(
            label: 'Position',
            icon: Icons.work,
            controller: _positionController),
        const SizedBox(height: 16),
        _buildTextField(
            label: 'Address',
            icon: Icons.location_on,
            controller: _addressController),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _addEmployee,
          child: const Text('Submit'),
        ),
      ],
    );
  }

  Widget _buildEmployeeCard(Map<String, String> employee) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.purpleAccent,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(employee['name'] ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📧 ${employee['email']}'),
            Text('📞 ${employee['phone']}'),
            Text('💼 ${employee['position']}'),
            Text('📍 ${employee['address']}'),
          ],
        ),
        trailing: const Icon(Icons.edit),
        isThreeLine: true,
      ),
    );
  }

  Widget _buildEmployeeList() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('All Employees (${employeeList.length})',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ...employeeList.map(_buildEmployeeCard),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Employee Management',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ToggleButtons(
            isSelected: [showAddEmployee, !showAddEmployee],
            onPressed: (index) {
              setState(() {
                showAddEmployee = index == 0;
              });
            },
            borderRadius: BorderRadius.circular(10),
            selectedColor: Colors.white,
            fillColor: Colors.purple,
            color: Colors.black54,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text('Add Employee'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text('List Employees'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: showAddEmployee
                ? _buildAddEmployeeForm()
                : _buildEmployeeList(),
          ),
        ],
      ),
    );
  }
}
