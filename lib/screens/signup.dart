import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_market_application/shared/app_bar.dart';
import 'package:super_market_application/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

var email, password, user;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();

  signup() async {
    var formdata = _formkey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
              context: context,
              title: "error",
              body: Text("password is too weak"))
            ..show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
              context: context,
              title: "error",
              body: Text("The account already exists for that email."))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    } else
      print("not valid");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar(),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Container(
                width: 200.0,
                height: 280.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Text(
                'Register...',
                style: TextStyle(
                  color: green,
                  fontSize: fontSizeH,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (val) {
                        email = val;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "email is too long";
                        }
                        if (val.length < 6) {
                          return "email is too short";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: green,
                        ),
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: green,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      onSaved: (val) {
                        password = val;
                      },
                      validator: (val) {
                        if (val!.length > 12) {
                          return "password is too long";
                        }
                        if (val.length < 4) {
                          return "password is can't be less than 4 ";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: green,
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: green,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      onSaved: (val) {
                        user = val;
                      },
                      validator: (val) {
                        if (val!.length > 20) {
                          return "username is too long";
                        }
                        if (val.length < 4) {
                          return "user name is too short";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'username',
                        hintStyle: TextStyle(
                          color: green,
                        ),
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: green,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var response = await signup();
                        if (response != null) {
                          Navigator.of(context).pushReplacementNamed("/signin");
                        } else {
                          print("signup failed");
                        }
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: fontSizeM,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: green,
                        padding: EdgeInsets.symmetric(
                            horizontal: 35.0, vertical: 15.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
