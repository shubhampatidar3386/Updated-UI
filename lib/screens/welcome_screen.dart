// import 'package:flutter/material.dart';
//
// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFD42228),
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
//                   style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 12),
//                 Text(
//                   "DigitalBank makes banking hassle-free and a lot easier for you.",
//                   style: TextStyle(color: Colors.white70, fontSize: 14),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//             Image.asset('assets/piggy.png', height: 200), // Ensure this asset exists
//             Column(
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.red,
//                     minimumSize: const Size.fromHeight(50),
//                   ),
//                   icon: const Icon(Icons.g_mobiledata),
//                   label: const Text("Sign in With Google"),
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () => Navigator.pushNamed(context, '/signup'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
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
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD42228), // Red background
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                SizedBox(height: 60),
                Text(
                  "WELCOME",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Welcome to the Construction App — manage workers, track attendance, and monitor earnings with ease.",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            // You can remove this Image if you don't have assets
            // Or replace with your own construction-themed image
            // Image.asset('assets/construction.png', height: 200),

            const Spacer(),

            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Add Google Sign-In functionality or remove icon if not needed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.red,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  icon: const Icon(Icons.g_mobiledata), // or remove this
                  label: const Text("Sign in With Google"),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text("Create An Account"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

