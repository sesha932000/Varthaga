import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reffralacc/Model/login_model.dart';
import 'package:reffralacc/home.dart';
import 'package:reffralacc/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _email = TextEditingController();

   LoginRequestModel? requestModel;

  @override
  void iniState() {
    super.initState();
    requestModel = LoginRequestModel(password: '', email: '');
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
                    height: 20,
                  ),

                  //////////   Image   //////////
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Image.asset('images/logo.jpg'),
                    margin: const EdgeInsets.symmetric(),
                  ),

                  const Text(
                    ' Login Account ',
                    style: TextStyle(fontSize: 20),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  /////////EMAIL ADDRESS/////////

                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      labelText: "Email Address",
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (input) => requestModel?.email = input!,
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

                  const SizedBox(
                    height: 15,
                  ),

                  TextFormField(
                      //////////// PASSWORD/////////
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      controller: _pass,
                      onSaved: (input) => requestModel?.password = input!,
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

                  const SizedBox(
                    height: 10,
                  ),

                  //forgot password screen
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password',
                    ),
                  ),

                  Container(
                    height: 50.0,
                    width: 450,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                        child: const Text(
                          "Login",
                        ),
                        onPressed: () {
                          if (validateAndSave()) {
                            if (kDebugMode) {
                              print(requestModel?.toJson());
                            }
                          }
                          // if (_key.currentState!.validate()) {
                          //   _key.currentState?.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        }),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: <Widget>[
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => const Pub()),
                          );
                          //signup screen
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
