import 'package:autentication/app/core/parametros.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AddUser extends StatelessWidget {
  final String name;
  final String email;
  final String password;
  const AddUser({
    Key? key,
    required this.name,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection("users");

    Future<void> addUser() {
      return user
          .add({
            "name": name,
            "email": email,
            "password": password,
          })
          .then(
            (value) => print("Usuário adicionado!!"),
          )
          .catchError(
            (onError) => print("Error: $onError"),
          );
    }

    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFCE38A),
          ),
        ),
        TextButton(
          onPressed: addUser,
          child: const Text(
            'Register',
            style: TextStyle(
              color: Colors.black,
              fontSize: 34,
            ),
          ),
        ),
      ],
    );
  }
}
