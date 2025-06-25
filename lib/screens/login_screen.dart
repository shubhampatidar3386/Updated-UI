// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text("Login", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: emailController,
//                 decoration: const InputDecoration(labelText: 'Email'),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(labelText: 'Password'),
//               ),
//               const SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, '/');
//                 },
//                 child: const Text('Login'),
//               ),
//               const SizedBox(height: 16),
//               TextButton(
//                 onPressed: () => Navigator.pushNamed(context, '/signup'),
//                 child: const Text("Don't have an account? Register"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text("Welcome To Construction App", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text("Continue to sign in!", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 24),
              TextFormField(decoration: const InputDecoration(labelText: 'Email')),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?", style: TextStyle(fontSize: 12)),
                ),
              ),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  const Text("Remember me"),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text("Sign In"),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: const Text("Don't have an Account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

