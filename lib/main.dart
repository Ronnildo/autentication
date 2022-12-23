import 'package:autentication/app/login.dart';
import 'package:flutter/material.dart';

import 'app/register.dart';

void main() {
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
