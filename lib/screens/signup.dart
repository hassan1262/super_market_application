import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_market_application/shared/app_bar.dart';
import 'package:super_market_application/shared/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();

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
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? 'Enter phone number' : null,
                      onChanged: (val) {},
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                          color: green,
                        ),
                        prefixIcon: Icon(
                          Icons.phone_android_outlined,
                          color: green,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
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
