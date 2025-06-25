import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Construction Manager')),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          DashboardCard(title: 'Add Employee', icon: Icons.person_add, route: '/add_employee', color: Colors.purple),
          DashboardCard(title: 'Attendance', icon: Icons.access_time, route: '/attendance', color: Colors.green),
          DashboardCard(title: 'Employee Tracking', icon: Icons.map, route: '/employee_tracking', color: Colors.blue),
          DashboardCard(title: 'Profile', icon: Icons.person, route: '/profile', color: Colors.red),
        ],
      ),
    );
  }
}