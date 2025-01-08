import 'package:flutter/material.dart';
import 'package:koskosan/app/home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Controllers untuk menangkap input dari TextField
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Email dan password yang valid
  final String validEmail = "Pengguna";
  final String validPassword = "katasandi";

  // Fungsi validasi login
  void validateLogin(BuildContext context) {
    final String email = emailController.text;
    final String password = passwordController.text;

    if (email == validEmail && password == validPassword) {
      // Navigasi ke halaman KostPage jika login berhasil
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const KostPage()),
      );
    } else {
      // Menampilkan pesan error jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email atau password salah!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/house.jpg',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 52),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Input Email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: emailController, // Tambahkan controller
                decoration: const InputDecoration(
                  hintText: 'Email ID',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Input Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: passwordController, // Tambahkan controller
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye),
                    onPressed:
                        () {}, // Tambahkan logika show/hide password jika diperlukan
                  ),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  // Tambahkan navigasi ke halaman lupa password
                },
                child: const Text(
                  'Lupa password?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Tombol Masuk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                onPressed: () {
                  validateLogin(context); // Panggil fungsi validasi login
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff06283D),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                child: const Text(
                  'Masuk',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Belum punya akun? Daftar sekarang!',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
