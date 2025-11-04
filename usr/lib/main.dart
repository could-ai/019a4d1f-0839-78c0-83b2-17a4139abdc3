import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/application_form_screen.dart';
import 'screens/application_list_screen.dart';
import 'screens/application_detail_screen.dart';
import 'models/job_application.dart';

void main() {
  runApp(const JobApplicationApp());
}

class JobApplicationApp extends StatelessWidget {
  const JobApplicationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Applications',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black, // Set app-wide background to black
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/applications': (context) => const ApplicationListScreen(),
        '/new_application': (context) => const ApplicationFormScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/application_detail') {
          final application = settings.arguments as JobApplication;
          return MaterialPageRoute(
            builder: (context) => ApplicationDetailScreen(application: application),
          );
        }
        return null;
      },
    );
  }
}