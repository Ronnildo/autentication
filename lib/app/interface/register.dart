// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/buttom_form.dart';
import 'widgets/image_container.dart';
import 'widgets/input_data.dart';
import 'widgets/input_detector.dart';
import 'login.dart';
import '../model/user_model.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _name = "";
  String? _email = "";
  String? _password = "";
  String _msgError = "";

  List data = [];

  _login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  void limparCampo() {
    setState(() {
      _nameController.text = "";
      _emailController.text = "";
      _passwordController.text = "";
    });
  }

  addUser() {
    _name = _nameController.text;
    _email = _emailController.text;
    _password = _passwordController.text;

    if (_name!.isNotEmpty) {
      if (_email!.isNotEmpty && _email!.contains("@")) {
        if (_password!.isNotEmpty && _password!.length >= 6) {
          _msgError = "";
          UserModel userModel = UserModel(
            _name!,
            _email!,
            _password!,
          );
          cadastrar(userModel);
        } else {
          setState(() {
            _msgError = "Preencha o campo Password";
          });
        }
      } else {
        setState(() {
          _msgError = "Preencha o campo E-mail";
        });
      }
    } else {
      setState(() {
        _msgError = "Preencha o campo Name";
      });
    }
  }

  cadastrar(UserModel userModel) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(
      email: userModel.email!,
      password: userModel.password!,
    )
        .then(
      (autentic) {
        auth.currentUser!.updateDisplayName(userModel.name!);
        setState(
          () {
            _msgError = "Usuário Cadastrado!";
          },
        );
        CollectionReference user = FirebaseFirestore.instance
            .collection("users")
          ..doc(autentic.user!.uid.toString());
        user
            .add(
          userModel.toJson(),
        )
            .then(
          (value) {
            print("Dados salvos com sucesso!");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
        ).catchError(
          (onError) {
            setState(() {
              _msgError = "Erro ao cadastrar usuário! Tente novamente.";
            });
          },
        );
      },
    ).catchError(
      (onError) {
        List erro = onError.toString().split("]");
        print(erro);
        setState(
          () {
            _msgError = erro[1].toString();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ImageContainer(
          image: "assets/images/register.png",
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 100,
                ),
                child: Text(
                  "Create\nAccount",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InputFormData(
                controller: _nameController,
                text: "Name",
                corText: Colors.white,
                ocultar: false,
              ),
              const SizedBox(
                height: 32,
              ),
              InputFormData(
                controller: _emailController,
                text: "E-mail",
                corText: Colors.white,
                ocultar: false,
              ),
              const SizedBox(
                height: 32,
              ),
              InputFormData(
                controller: _passwordController,
                text: "Password",
                corText: Colors.white,
                ocultar: true,
              ),
              Text(
                _msgError,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ButtomFormData(
                    text: "Register",
                    push: addUser,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextDetector(onTap: _login, text: "Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
