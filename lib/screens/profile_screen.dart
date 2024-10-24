import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.manrope(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menambahkan foto profil
            CircleAvatar(
              radius: 80, // Ukuran lingkaran
              backgroundImage: AssetImage('assets/images/poto.jpg'),
            ),
            const SizedBox(height: 20),
            _buildProfileInfo('Username:', 'hertin'),
            const SizedBox(height: 20),
            _buildProfileInfo('Email:', 'hertinnurhayati4@gmail.com'),
            const SizedBox(height: 20),
            _buildProfileInfo('Full Name:', 'Hertin Nurhayati'),
            const SizedBox(height: 40),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.manrope(fontSize: 16),
        ),
        Text(
          value,
          style: GoogleFonts.manrope(fontSize: 16),
        ),
      ],
    );
  }

  ElevatedButton _buildLogoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context); // Kembali ke halaman login
      },
      child: const Text('Logout'),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
    );
  }
}
