import 'package:flutter/material.dart';
import 'package:koskosan/app/login.dart';
import 'package:koskosan/app/signup.dart';
import 'package:koskosan/app/home.dart';
import 'package:koskosan/app/carikosan.dart';
import 'package:koskosan/app/carikosan.dart';
import 'package:koskosan/app/detailkos.dart';
import 'package:koskosan/app/pemesan.dart';
import 'package:koskosan/app/riwayat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Hapus const di sini
    );
  }
}
