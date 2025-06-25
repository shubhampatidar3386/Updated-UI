// import 'package:flutter/material.dart';
//
// class DashboardCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final String route;
//   final Color color;
//
//   DashboardCard({required this.title, required this.icon, required this.route, required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: color,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: InkWell(
//         onTap: () => Navigator.pushNamed(context, route),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 40, color: Colors.white),
//             SizedBox(height: 10),
//             Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  final Color color;

  const DashboardCard({super.key, required this.title, required this.icon, required this.route, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), // Rounded edges
      elevation: 5, // Subtle shadow for depth
      color: color,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}