import 'package:flutter/material.dart';

class ListEmployeeScreen extends StatelessWidget {
  const ListEmployeeScreen({super.key});

  final List<Map<String, String>> employees = const [
    {
      'name': 'John Smith',
      'email': 'john@example.com',
      'phone': '+1 234-567-8901',
      'position': 'Site Manager',
      'address': '123 Main St',
    },
    {
      'name': 'Sarah Johnson',
      'email': 'sarah@example.com',
      'phone': '+1 234-567-8902',
      'position': 'Construction Worker',
      'address': '456 Oak Ave',
    },
    {
      'name': 'Mike Wilson',
      'email': 'mike@example.com',
      'phone': '+1 234-567-8903',
      'position': 'Architect',
      'address': '789 Pine Rd',
    },
  ];

  Widget _buildEmployeeCard(Map<String, String> employee) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(employee['name'] ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Email: ${employee['email']}'),
            Text('Phone: ${employee['phone']}'),
            Text('Position: ${employee['position']}'),
            Text('Address: ${employee['address']}'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Employees')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('All Employees (${employees.length})', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  return _buildEmployeeCard(employees[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}