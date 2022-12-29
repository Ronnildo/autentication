import 'package:autentication/app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './login.dart';
import 'package:lottie/lottie.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  final String name;
  final String getIdToken;
  final String email;
  const Home({
    super.key,
    required this.name,
    required this.getIdToken,
    required this.email,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _firebaseAuth = FirebaseAuth.instance;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 28, 176, 187),
              ),
              accountName: Text(
                widget.name,
                style: const TextStyle(fontSize: 16),
              ),
              accountEmail: Text(
                widget.email,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            ListTile(
              dense: true,
              title: const Text(
                'Sair',
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(Icons.exit_to_app),
              onTap: () {
                sair();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 176, 187),
        centerTitle: true,
        title: const Text(
          'BEM VINDO !!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Lottie.asset(
              "assets/images/91194-development.json",
              // height: 400,
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  topLeft: Radius.circular(60),
                ),
                color: Color.fromARGB(255, 28, 176, 187),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.getIdToken,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  sair() async {
    await _firebaseAuth.signOut().then(
          (user) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          ),
        );
  }
}
