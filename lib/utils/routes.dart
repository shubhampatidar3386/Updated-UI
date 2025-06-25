// // import 'package:flutter/material.dart';
// // import '../screens/dashboard_screen.dart';
// // import '../screens/add_employee_screen.dart';
// // import '../screens/attendance_screen.dart';
// // import '../screens/employee_tracking_screen.dart';
// // import '../screens/profile_screen.dart';
// //
// // final Map<String, WidgetBuilder> appRoutes = {
// //   '/': (context) => const DashboardScreen(),
// //   '/add_employee': (context) => AddEmployeeScreen(),
// //   '/attendance': (context) => const AttendanceScreen(),
// //   '/employee_tracking': (context) => const EmployeeTrackingScreen(),
// //   '/profile': (context) => const ProfileScreen(),
// //
// // };
// import 'package:flutter/material.dart';
// import '../screens/home_screen.dart';
// import '../screens/add_employee_screen.dart';
//
// class AppRoutes {
//   static const String home = '/';
//   static const String addEmployee = '/add_employee';
//
//   static Map<String, Widget Function(BuildContext)> routes = <String, Widget Function(BuildContext p1)>{
//     home: (context) => HomeScreen(),
//     addEmployee: (context) => AddEmployeeScreen(),
//   };
// }
//
// class HomeScreen {
// }
// import 'package:flutter/material.dart';
// import '../screens/home_screen.dart';
// import '../screens/add_employee_screen.dart';
//
// class AppRoutes {
//   static const String home = '/';
//   static const String addEmployee = '/add_employee';
//
//   static Map<String, Widget Function(BuildContext)> routes = {
//     home: (context) => HomeScreen(), // ✅ Fixed HomeScreen
//     addEmployee: (context) => AddEmployeeScreen(),
//   };
// }
//
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/add_employee_screen.dart';
import '../screens/attendance_screen.dart';
import '../screens/employee_tracking_screen.dart';
import '../screens/profile_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String addEmployee = '/add_employee';
  static const String attendance = '/attendance';
  static const String employeeTracking = '/employee_tracking';
  static const String profile = '/profile';

  /// Centralized route configuration for better maintainability
  static final Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => HomeScreen(),
    addEmployee: (context) => AddEmployeeScreen(),
    attendance: (context) =>  AttendanceScreen(),
    employeeTracking: (context) => const EmployeeTrackingScreen(),
    profile: (context) => const ProfileScreen(),
  };

  /// Handles dynamic routing with fallback support
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case addEmployee:
        return MaterialPageRoute(builder: (_) =>  AddEmployeeScreen());
      case attendance:
        return MaterialPageRoute(builder: (_) =>  AttendanceScreen());
      case employeeTracking:
        return MaterialPageRoute(builder: (_) => const EmployeeTrackingScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(builder: (_) =>  HomeScreen()); // Fallback
    }
  }
}