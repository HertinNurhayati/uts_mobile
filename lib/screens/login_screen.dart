import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorMessage; // Variabel untuk menyimpan pesan kesalahan

  void _login() {
    // Ambil nilai dari text field
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Verifikasi username dan password
    if (username == 'hertin' && password == '123') {
      // Jika berhasil, navigasi ke halaman home
      Navigator.pushNamed(context, '/home');
    } else {
      // Jika gagal, perbarui pesan kesalahan
      setState(() {
        _errorMessage = 'Invalid username or password.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 167, 213, 244), // Set latar belakang berwarna biru
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png', // Pastikan kamu mengganti dengan path logo yang benar
                      height: 100, // Sesuaikan ukuran logo
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Welcome Back!',
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Ubah warna teks menjadi putih
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField('Username', false, _usernameController),
                    const SizedBox(height: 16),
                    _buildTextField('Password', true, _passwordController),
                    const SizedBox(height: 20),
                    if (_errorMessage != null) ...[ // Tampilkan pesan kesalahan jika ada
                      Text(
                        _errorMessage!,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                    _buildLoginButton(context),
                    const SizedBox(height: 20),
                    _buildRegisterLink(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextField(String label, bool isPassword, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        suffixIcon: isPassword ? const Icon(FeatherIcons.eye) : null,
      ),
    );
  }

  ElevatedButton _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: _login, // Panggil fungsi login saat ditekan
      child: const Text('Login'),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
    );
  }

  Widget _buildRegisterLink() {
    return TextButton(
      onPressed: () {
        // Implement navigation to register screen
      },
      child: Text(
        "Don't have an account? Register",
        style: GoogleFonts.manrope(
          color: const Color(0xFF818AF9),
        ),
      ),
    );
  }
}
