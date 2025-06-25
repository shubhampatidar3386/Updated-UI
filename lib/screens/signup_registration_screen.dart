// import 'package:flutter/material.dart';
//
// class SignupRegistrationScreen extends StatefulWidget {
//   const SignupRegistrationScreen({super.key});
//
//   @override
//   State<SignupRegistrationScreen> createState() => _SignupRegistrationScreenState();
// }
//
// class _SignupRegistrationScreenState extends State<SignupRegistrationScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   void _register() {
//     if (_formKey.currentState!.validate()) {
//       Navigator.pushReplacementNamed(context, '/');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               children: [
//                 const SizedBox(height: 24),
//                 const Text("Register Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
//                 const SizedBox(height: 32),
//
//                 TextFormField(
//                   controller: _fullNameController,
//                   decoration: const InputDecoration(labelText: 'Full Name'),
//                   validator: (value) => value!.isEmpty ? 'Please enter your full name' : null,
//                 ),
//                 const SizedBox(height: 16),
//
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(labelText: 'Email'),
//                   validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
//                 ),
//                 const SizedBox(height: 16),
//
//                 TextFormField(
//                   controller: _phoneController,
//                   decoration: const InputDecoration(labelText: 'Phone Number'),
//                   keyboardType: TextInputType.phone,
//                   validator: (value) => value!.isEmpty ? 'Please enter your phone number' : null,
//                 ),
//                 const SizedBox(height: 16),
//
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(labelText: 'Password'),
//                   validator: (value) => value!.length < 6 ? 'Password must be at least 6 characters' : null,
//                 ),
//                 const SizedBox(height: 32),
//
//                 ElevatedButton(
//                   onPressed: _register,
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     backgroundColor: Colors.deepPurple,
//                   ),
//                   child: const Text('Register', style: TextStyle(fontSize: 16)),
//                 ),
//
//                 const SizedBox(height: 16),
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text('Already have an account? Login'),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// class SignupRegistrationScreen extends StatefulWidget {
//   const SignupRegistrationScreen({super.key});
//
//   @override
//   State<SignupRegistrationScreen> createState() => _SignupRegistrationScreenState();
// }
//
// class _SignupRegistrationScreenState extends State<SignupRegistrationScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   void _register() {
//     if (_formKey.currentState!.validate()) {
//       Navigator.pushReplacementNamed(context, '/');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFD42228),
//       body: Center(
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 24),
//           padding: const EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(24),
//           ),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               shrinkWrap: true,
//               children: [
//                 const Text(
//                   "Welcome",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "Continue to sign up!",
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 const SizedBox(height: 24),
//
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                   validator: (value) =>
//                   value!.isEmpty ? 'Enter your name' : null,
//                 ),
//                 const SizedBox(height: 16),
//
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(labelText: 'Email'),
//                   validator: (value) =>
//                   value!.isEmpty ? 'Enter your email' : null,
//                 ),
//                 const SizedBox(height: 16),
//
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(labelText: 'Password'),
//                   obscureText: true,
//                   validator: (value) =>
//                   value!.length < 6 ? 'Minimum 6 characters' : null,
//                 ),
//                 const SizedBox(height: 16),
//
//                 TextFormField(
//                   controller: _confirmPasswordController,
//                   decoration: const InputDecoration(labelText: 'Confirm Password'),
//                   obscureText: true,
//                   validator: (value) =>
//                   value != _passwordController.text ? 'Passwords don’t match' : null,
//                 ),
//                 const SizedBox(height: 16),
//
//                 Row(
//                   children: [
//                     Checkbox(value: true, onChanged: (_) {}),
//                     const Expanded(
//                       child: Text(
//                         "By signing up, you agree to our terms & conditions.",
//                         style: TextStyle(fontSize: 12),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//
//                 ElevatedButton(
//                   onPressed: _register,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     minimumSize: const Size.fromHeight(50),
//                   ),
//                   child: const Text("Sign Up"),
//                 ),
//                 TextButton(
//                   onPressed: () => Navigator.pushNamed(context, '/login'),
//                   child: const Text("Already have an account? Sign In"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFD42228), // Red background
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Column(
//               children: [
//                 SizedBox(height: 60),
//                 Text(
//                   "WELCOME",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1.2,
//                   ),
//                 ),
//                 SizedBox(height: 12),
//                 Text(
//                   "Welcome to the Construction App — manage workers, track attendance, and monitor earnings with ease.",
//                   style: TextStyle(color: Colors.white70, fontSize: 14),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//
//             // You can remove this Image if you don't have assets
//             // Or replace with your own construction-themed image
//             // Image.asset('assets/construction.png', height: 200),
//
//             const Spacer(),
//
//             Column(
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     // Add Google Sign-In functionality or remove icon if not needed
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.red,
//                     minimumSize: const Size.fromHeight(50),
//                   ),
//                   icon: const Icon(Icons.g_mobiledata), // or remove this
//                   label: const Text("Sign in With Google"),
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () => Navigator.pushNamed(context, '/signup'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     foregroundColor: Colors.white,
//                     minimumSize: const Size.fromHeight(50),
//                   ),
//                   child: const Text("Create An Account"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';

class SignupRegistrationScreen extends StatefulWidget {
  const SignupRegistrationScreen({super.key}); // ✅ const constructor

  @override
  State<SignupRegistrationScreen> createState() => _SignupRegistrationScreenState();
}

class _SignupRegistrationScreenState extends State<SignupRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Normally you'd handle signup logic here
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD42228),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Continue to sign up!",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),

                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) =>
                  value!.isEmpty ? 'Enter your name' : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) =>
                  value!.isEmpty ? 'Enter your email' : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) =>
                  value!.length < 6 ? 'Minimum 6 characters' : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (value) =>
                  value != _passwordController.text ? 'Passwords don’t match' : null,
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Checkbox(value: true, onChanged: (_) {}),
                    const Expanded(
                      child: Text(
                        "By signing up, you agree to our terms & conditions.",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text("Sign Up"),
                ),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                  child: const Text("Already have an account? Sign In"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
