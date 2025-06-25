// import 'package:flutter/material.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/employee_management_screen.dart';
// import 'screens/employee_tracking_screen.dart';
// import 'screens/profile_screen.dart';
// import 'screens/attendance_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Employee Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: const Color(0xFFF3F4F6),
//         useMaterial3: true,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const DashboardScreen(),
//         '/add_employee': (context) => const EmployeeManagementScreen(),
//         '/attendance': (context) => const AttendanceScreen(),
//         '/employee_tracking': (context) => const EmployeeTrackingScreen(),
//         '/profile': (context) => const ProfileScreen(),
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/employee_management_screen.dart';
// import 'screens/employee_tracking_screen.dart';
// import 'screens/profile_screen.dart';
// import 'screens/attendance_screen.dart';
// import 'screens/login_screen.dart';                     // ✅ New
// import 'screens/signup_registration_screen.dart';       // ✅ New
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Employee Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: const Color(0xFFF3F4F6),
//         useMaterial3: true,
//       ),
//       initialRoute: '/login',  // 👈 Start with Login
//       routes: {
//         '/': (context) => const DashboardScreen(),
//         '/login': (context) => const LoginScreen(),
//         '/signup': (context) => const SignupRegistrationScreen(),
//         '/add_employee': (context) => const EmployeeManagementScreen(),
//         '/attendance': (context) => const AttendanceScreen(),
//         '/employee_tracking': (context) => const EmployeeTrackingScreen(),
//         '/profile': (context) => const ProfileScreen(),
//       },
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/employee_management_screen.dart';
import 'screens/employee_tracking_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/attendance_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_registration_screen.dart'; // ✅ Correctly imported

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
        useMaterial3: true,
      ),
      initialRoute: '/login', // Start with Login

      routes: {
        '/': (context) => const DashboardScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupRegistrationScreen(), // ✅ No error if const constructor
        '/add_employee': (context) => const EmployeeManagementScreen(),
        '/attendance': (context) => const AttendanceScreen(),
        '/employee_tracking': (context) => const EmployeeTrackingScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

