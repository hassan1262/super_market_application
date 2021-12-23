import 'package:flutter/material.dart';
import 'package:super_market_application/shared/constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();

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
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {},
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
                      validator: (val) =>
                          val!.isEmpty ? 'Enter a password' : null,
                      onChanged: (val) {},
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
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Processing Data'),
                            ),
                          );
                          Navigator.pushNamed(context, '/');
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
