import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _navigate(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  Widget _buildAnimatedCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String route,
    required Color color,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        double scale = 1.0;

        return MouseRegion(
          onEnter: (_) => setState(() => scale = 1.05),
          onExit: (_) => setState(() => scale = 1.0),
          child: GestureDetector(
            onTapDown: (_) => setState(() => scale = 1.05),
            onTapUp: (_) {
              setState(() => scale = 1.0);
              _navigate(context, route);
            },
            onTapCancel: () => setState(() => scale = 1.0),
            child: AnimatedScale(
              scale: scale,
              duration: const Duration(milliseconds: 200),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(icon, size: 40, color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        title: Row(
          children: const [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.apartment, color: Color(0xFF1E293B)),
            ),
            SizedBox(width: 12),
            Text(
              'Construction Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    _buildAnimatedCard(
                      context: context,
                      title: 'Add Employee',
                      icon: Icons.person_add,
                      route: '/add_employee',
                      color: Colors.purple,
                    ),
                    _buildAnimatedCard(
                      context: context,
                      title: 'Attendance Module',
                      icon: Icons.access_time,
                      route: '/attendance',
                      color: Colors.green,
                    ),
                    _buildAnimatedCard(
                      context: context,
                      title: 'Employee Tracking',
                      icon: Icons.location_on,
                      route: '/employee_tracking',
                      color: Colors.blue,
                    ),
                    _buildAnimatedCard(
                      context: context,
                      title: 'Profile',
                      icon: Icons.person,
                      route: '/profile',
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
