import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_mobile/screens/login_screen.dart'; // Import login screen

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover, // Pastikan ini ada
            ),
          ),
          Center(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 42),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100, // Sesuaikan ukuran logo
                  ),
                  const SizedBox(height: 73),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Helping you\nto keep ",
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        color: const Color(0xFFDEE1FE),
                        letterSpacing: 3.5 / 100,
                        height: 1.5,
                      ),
                      children: const [
                        TextSpan(
                          text: "your bestie",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(text: "\nstay healthy!"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text('Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Ganti primary menjadi backgroundColor
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Ukuran tombol
                      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
