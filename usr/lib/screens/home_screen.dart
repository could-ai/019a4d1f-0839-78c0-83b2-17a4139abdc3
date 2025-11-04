import 'package:flutter/material.dart';
import '../models/job_application.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Applications'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.handshake, // Changed from Icons.work to Icons.handshake for a handshake logo
              size: 80,
              color: Colors.white, // Changed color to white for visibility on black background
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Job Applications',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Added white color for text visibility on black background
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Manage your job applications and upload your documents',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70, // Slightly transparent white for subtitle on black background
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/new_application');
              },
              icon: const Icon(Icons.add),
              label: const Text('New Application'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/applications');
              },
              icon: const Icon(Icons.list),
              label: const Text('View Applications'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}