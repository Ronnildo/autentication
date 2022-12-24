import 'package:autentication/app/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'app/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Autetication App",
      // modifica pra /register, mas quanto for da um git add muda pra /login
      initialRoute: "/register",
      routes: {
        "/register": (context) => const Register(),
        "/login": (context) => const Login(),
      },
    ),
  );
}
