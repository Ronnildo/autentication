import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'widgets/buttom_form.dart';
import 'widgets/image_container.dart';
import 'widgets/input_data.dart';
import 'widgets/input_detector.dart';
import '../model/user_model.dart';
import 'home.dart';
import 'register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _msgError = "";
  String? _email;
  String? _password;

  _register() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Register(),
      ),
    );
  }

  autenticarUser() {
    setState(() {
      _email = _emailController.text;
      _password = _passwordController.text;
    });

    if (_email!.isNotEmpty && _email!.contains("@")) {
      if (_password!.isNotEmpty) {
        setState(() {
          _msgError = "";
        });
        UserModel userModel = UserModel("", _email!, _password!);

        login(userModel);
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
  }

  login(UserModel userModel) {
    String? userToken = "";
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(
      email: userModel.email!,
      password: userModel.password!,
    )
        .then((autentic) {
      setState(() {
        _msgError = "";
      });

      CollectionReference user = FirebaseFirestore.instance.collection("users")
        ..doc(autentic.user!.uid);
      setState(() {
        autentic.user!.getIdToken().then((token) {
          userToken = token;
        });
      });
      print(userToken);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(
            name: autentic.user!.displayName.toString(),
            getIdToken: userToken.toString(),
            email: autentic.user!.email.toString(),
          ),
        ),
      );
    }).catchError((onError) {
      setState(() {
        _msgError = "E-mail ou password incorreto.";
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    autenticarUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ImageContainer(
          image: "assets/images/login.png",
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 180,
                ),
                child: Text(
                  "Hello\nAgain!",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: InputFormData(
                  controller: _emailController,
                  text: "E-mail",
                  corText: Colors.grey,
                  ocultar: false,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              InputFormData(
                controller: _passwordController,
                text: "Password",
                corText: Colors.grey,
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
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ButtomFormData(text: "Login", push: autenticarUser),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextDetector(onTap: _register, text: "Register"),
                  TextDetector(onTap: () {}, text: "Forgot Password")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
