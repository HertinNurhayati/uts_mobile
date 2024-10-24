import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: GoogleFonts.manrope(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menambahkan logo
            Center(
              child: Image.asset(
                'assets/images/logo.png', // Ganti dengan path logo Anda
                width: 100, // Ukuran logo
                height: 100,
              ),
            ),
            const SizedBox(height: 20),

            // Menambahkan judul deskripsi
            Text(
              'Tentang Aplikasi',
              style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Menambahkan deskripsi aplikasi
            Text(
              'Aplikasi Layanan Dokter Hewan adalah platform yang memudahkan Anda untuk mengakses layanan kesehatan hewan peliharaan. '
              'Kami menyediakan informasi mengenai dokter hewan terdekat, layanan vaksinasi, perawatan medis, dan konsultasi. '
              'Dengan aplikasi ini, Anda dapat mencari dokter hewan berdasarkan lokasi dan jenis layanan yang dibutuhkan. '
              'Kami berkomitmen untuk memberikan pelayanan terbaik demi kesehatan dan kesejahteraan hewan peliharaan Anda.',
              style: GoogleFonts.manrope(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 40),
            // Menambahkan tombol kembali
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
                child: const Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
