import 'package:flutter/material.dart';

class EmployeeTrackingScreen extends StatelessWidget {
  const EmployeeTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final employees = [
      {
        'name': 'John Smith',
        'location': 'Construction Site A',
        'lastSeen': '2 min ago',
        'coords': '40.7128, -74.0060',
        'initials': 'JS',
      },
      {
        'name': 'Sarah Johnson',
        'location': 'Office Building',
        'lastSeen': '5 min ago',
        'coords': '40.7130, -74.0055',
        'initials': 'SJ',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Tracking'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  Icon(Icons.location_on, size: 40, color: Colors.blue),
                  SizedBox(height: 10),
                  Text(
                    'Live Location Map',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  Text(
                    'Real-time employee positions',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Active Employees',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final emp = employees[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        child: Text(emp['initials']!, style: const TextStyle(color: Colors.blue)),
                      ),
                      title: Text(emp['name']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(emp['location']!),
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 14),
                              const SizedBox(width: 4),
                              Text("Last seen: ${emp['lastSeen']}"),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text('Coordinates: ${emp['coords']}'),
                        ],
                      ),
                      trailing: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call, color: Colors.blue),
                          SizedBox(height: 8),
                          Icon(Icons.circle, size: 12, color: Colors.green),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
