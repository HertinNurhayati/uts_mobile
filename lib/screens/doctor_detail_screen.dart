import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetailScreen extends StatelessWidget {
  final String doctorName;
  final String doctorImage;
  final List<String> doctorServices;
  final String description; // Deskripsi layanan

  const DoctorDetailScreen({
    Key? key,
    required this.doctorName,
    required this.doctorImage,
    required this.doctorServices,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctorName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/$doctorImage',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 16),
            Text(
              doctorName,
              style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Services: ${doctorServices.join(', ')}',
              style: GoogleFonts.manrope(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Description:',
              style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.manrope(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
