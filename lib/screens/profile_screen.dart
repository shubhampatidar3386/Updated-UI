import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.person, color: Colors.white, size: 35),
                    ),
                    const SizedBox(height: 12),
                    const Text('Admin User', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    const Text('Site Manager', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('admin@construction.com'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('+1 (555) 123-4567'),
                    ),
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.briefcase),
                      title: const Text('Site Manager'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: const Text('New York, NY'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Action Buttons
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Account Settings'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit Profile'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Logout', style: TextStyle(color: Colors.red)),
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Quick Stats
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Quick Stats', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Text('24', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red)),
                            SizedBox(height: 4),
                            Text('Total Employees'),
                          ],
                        ),
                        Column(
                          children: const [
                            Text('18', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)),
                            SizedBox(height: 4),
                            Text('Present Today'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

