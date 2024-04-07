// ignore_for_file: unused_import

import 'package:flutter/material.dart';
// Import screens
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/destination_details_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/tripdetails.dart';
import 'widgets/navigationpanel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explorers App',
      // Removed the 'home' property.
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        hintColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      // Define the routes
      initialRoute: '/', // Default is '/' but it's nice to be explicit
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(), // Updated to MainLayout
        '/details': (context) => const DestinationDetailsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/tripdetails': (context) => const TripDetailsScreen(),
        // ... other routes
      },
    );
  }
}
