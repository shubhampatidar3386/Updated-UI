import 'package:flutter/material.dart';
import 'add_employee.dart';
import 'list_employee.dart';

class AddViewScreen extends StatefulWidget {
  const AddViewScreen({super.key});

  @override
  State<AddViewScreen> createState() => _AddViewScreenState();
}

class _AddViewScreenState extends State<AddViewScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Management'),
        backgroundColor: Colors.black87,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.amber,
          tabs: const [
            Tab(text: 'View Employees'),
            Tab(text: 'Add Employee'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ListEmployeeScreen(),
          AddEmployeeScreen(),
        ],
      ),
    );
  }
}

