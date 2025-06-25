// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import '../models/employee.dart';
// // import 'package:construction_manager/services/employee_service.dart';
// //
// // class EmployeeService {
// //   final String apiUrl = "https://api.example.com/employees";
// //
// //   Future<List<Employee>> fetchEmployees() async {
// //     final response = await http.get(Uri.parse(apiUrl));
// //     if (response.statusCode == 200) {
// //       List jsonResponse = json.decode(response.body);
// //       return jsonResponse.map((data) => Employee.fromJson(data)).toList();
// //     } else {
// //       throw Exception('Failed to load employees');
// //     }
// //   }
// //
// //   Future<void> addEmployee(Employee employee) async {
// //     await http.post(
// //       Uri.parse(apiUrl),
// //       headers: {'Content-Type': 'application/json'},
// //       body: json.encode(employee.toJson()),
// //     );
// //   }
// // }
// // import "package:http/http.dart" as http;
// import 'dart:convert';
// import '../model/employee.dart';
// import '../models/employee.dart';
//
// class EmployeeService {
//   final String apiUrl = "https://api.example.com/employees";
//
//   get http => null;
//
//   Future<List<Employee>> fetchEmployees() async {
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//       if (response.statusCode == 200) {
//         List jsonResponse = json.decode(response.body);
//         return jsonResponse.map((data) => Employee.fromJson(data)).toList();
//       } else {
//         throw Exception('Failed to load employees');
//       }
//     } catch (e) {
//       print("Error fetching employees: $e");
//       return [];
//     }
//   }
//
//   Future<void> addEmployee(Employee employee) async {
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(employee.toJson()),
//       );
//       if (response.statusCode == 201) {
//         print("Employee added successfully!");
//       } else {
//         throw Exception('Failed to add employee');
//       }
//     } catch (e) {
//       print("Error adding employee: $e");
//     }
//   }
//
//   Future<void> updateEmployee(String id, Employee employee) async {
//     try {
//       final response = await http.put(
//         Uri.parse('$apiUrl/$id'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(employee.toJson()),
//       );
//       if (response.statusCode == 200) {
//         print("Employee updated successfully!");
//       } else {
//         throw Exception('Failed to update employee');
//       }
//     } catch (e) {
//       print("Error updating employee: $e");
//     }
//   }
//
//   Future<void> deleteEmployee(String id) async {
//     try {
//       final response = await http.delete(Uri.parse('$apiUrl/$id'));
//       if (response.statusCode == 200) {
//         print("Employee deleted successfully!");
//       } else {
//         throw Exception('Failed to delete employee');
//       }
//     } catch (e) {
//       print("Error deleting employee: $e");
//     }
//   }
// }
import "package:http/http.dart" as http;
import 'dart:convert';
import '../model/employee.dart';
import '../models/employee.dart';

class EmployeeService {
  final String apiUrl = "https://api.example.com/employees";

  Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => Employee.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      print("Error fetching employees: $e");
      return [];
    }
  }

  Future<void> addEmployee(Employee employee) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(employee.toJson()),
      );
      if (response.statusCode == 201) {
        print("Employee added successfully!");
      } else {
        throw Exception('Failed to add employee');
      }
    } catch (e) {
      print("Error adding employee: $e");
    }
  }

  static getEmployees() {}
}