class Employee {
  final String id;
  final String name;
  final String email;
  final String position;
  final String designation;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.position,
    required this.designation, required int age,
  });

  factory Employee.fromJson(Map<String, dynamic> data) {
    return Employee(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      position: data['position'] ?? '',
      designation: data['designation'] ?? '', age: 25,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'position': position,
      'designation': designation,
    };
  }
}