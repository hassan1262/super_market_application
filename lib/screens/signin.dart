import 'package:flutter/material.dart';
import 'package:super_market_application/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

var email, password;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  SignIn() async {
    var formdata = _formkey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
              context: context, title: "error", body: Text("wrong email"))
            ..show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
              context: context, title: "error", body: Text("Wrong password"))
            ..show();
        }
      }
    } else {
      print("not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Login to your account',
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
                      decoration: textInputDecoration.copyWith(
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
                      decoration: textInputDecoration.copyWith(
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
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password ?',
                            style: TextStyle(
                              fontSize: fontSizeS,
                              color: black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var check = await SignIn();
                        if (check != null) {
                          Navigator.of(context).pushReplacementNamed("/Home");
                        }
                      },
                      child: Text(
                        'Sign in',
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
                    const Text(
                      'or sign in with',
                      style: TextStyle(
                        fontSize: fontSizeM,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Image.asset(
                      'assets/google.png',
                      height: 50,
                    ),
                    style: btnStyle,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Image.asset(
                      'assets/facebook.png',
                      height: 50,
                    ),
                    style: btnStyle,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Image.asset(
                      'assets/twitter.png',
                      height: 50,
                    ),
                    style: btnStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  'Don\'t have an account ? Sign up',
                  style: TextStyle(
                    fontSize: fontSizeS,
                    color: black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
