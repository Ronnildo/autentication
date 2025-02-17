import 'package:autentication/app/interface/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'app/interface/register.dart';
import 'package:autentication/app/interface/home.dart';

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
      initialRoute: "/login",
      routes: {
        "/register": (context) => const Register(),
        "/login": (context) => const Login(),
      },
    ),
  );
}
