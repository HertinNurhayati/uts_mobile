import 'package:flutter/material.dart';
import 'screens/landing_page.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Layanan Dokter Hewan',
      initialRoute: '/landing', // Mengatur landing page sebagai halaman pertama
      routes: {
        '/landing': (context) => LandingPage(), // Rute untuk LandingPage
        '/': (context) => const LoginScreen(),  // Rute untuk LoginScreen
        '/home': (context) => HomeScreen(),     // Rute untuk HomeScreen
        '/profile': (context) => ProfileScreen(), // Rute untuk ProfileScreen
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
