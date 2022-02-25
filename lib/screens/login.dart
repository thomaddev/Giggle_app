import 'package:flutter/material.dart';
import 'package:giggle_app/screens/home.dart';
import 'package:giggle_app/screens/register.dart';

import '../models/user.dart';
import '../widgets/bases/main_top_bar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  User user = User();

  // Toggles the password show status
  void _toggleVisisbelPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(height: 50),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          errorText: null,
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) =>
                            val != "tang" ? "กรอก Username ผิดจ้า" : null,
                        onSaved: (value) {
                          user.username = value!;
                        }),
                    const SizedBox(height: 10),
                    TextFormField(
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          errorText: null,
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: _toggleVisisbelPassword),
                        ),
                        validator: (val) =>
                            val != "narak" ? "กรอก Password ผิดจ้า" : null,
                        onSaved: (value) {
                          user.password = value!;
                        }),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          print("${user.username} / ${user.password}");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Home();
                          }));
                        } else {
                          print("กรอกผิดจ้า");
                        }
                      },
                      child: const Text('Login'),
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
