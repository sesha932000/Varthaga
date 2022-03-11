import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:reffralacc/login.dart';
import 'package:reffralacc/api.dart';
import 'home.dart';
import 'package:reffralacc/splashscreen.dart';


void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home:splash()
  ),
  );
}

class Pub extends StatefulWidget {
  const Pub({Key? key}) : super(key: key);

  @override
  State<Pub> createState() => _PubState();
}

class _PubState extends State<Pub> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _mobilenumber = TextEditingController();
  final TextEditingController _refrral = TextEditingController();

  _register() {
    var data = {
      'name': _username.text,
      'password': _pass.text,
      'email': _email.text,
      'confirmpassword': _confirmPass.text,
      'mobilenumber': _mobilenumber.text,
      'refrral': _refrral.text,
    };
    var res = CallApi().postData(data, '_register');
    log('data: $data');
    var body = json.decode(res.body);
    if (body['success']) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Image.asset('images/logo.jpg'),
                    margin: const EdgeInsets.symmetric(),
                  ),
                  const Text(
                    ' Create Your account ',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _username,
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Field is required.";
                      }
                      if (value.trim().length < 4) {
                        return 'Username must be at least 4 characters in length';
                      }
                      return null;
                    },
                  ),

                  //////////////NUMBER//////////////
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _mobilenumber,
                    decoration: const InputDecoration(
                      labelText: "Mobile Number",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field is required.";
                      }
                      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      if (!RegExp(pattern).hasMatch(value)) {
                        return "Please enter valid mobile number";
                      }
                      return null;
                    },
                  ),

                  /////////EMAIL ADDRESS/////////
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      labelText: "Email Address",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field is required.";
                      }
                      String pattern = r'\w+@\w+\.\w+';
                      if (!RegExp(pattern).hasMatch(value)) {
                        return "Invalid E-mail Address format.";
                      }
                      return null;
                    },
                  ),

                  //////////PASSWORD////////

                  const SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                      ////////////HIDE PASSWORD/////////
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      controller: _pass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field is required.";
                        }
                        String pattern =
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        if (!RegExp(pattern).hasMatch(value)) {
                          return '''
        Password must be at least 8 characters,
        include an uppercase letter, number and symbol.
        ''';
                        }
                        return null;
                      }),

                  ////////////////// ConfirmPassword//////////////
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _confirmPass,
                    decoration: const InputDecoration(
                      labelText: " Confirm Password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field is required.";
                      }
                      if (value != _pass.text) return 'Not Match';
                      return null;
                    },
                  ),

                  ////////////Referral/////////
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _refrral,
                    decoration: const InputDecoration(
                      labelText: "Referral Code",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 50.0,
                    width: 450,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text(
                        "Submit",
                      ),
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          _key.currentState?.save();
                            _register();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  TextButton(
                      child: const Text(
                        'Login!',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
