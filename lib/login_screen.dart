import 'package:flutter_application_web/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String? validateEmail(String value) {
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Color(0xFF8A2387),
                      Color(0xFFE94057),
                      Color(0xFFF27121),
                    ])),
                child: Column(children: <Widget>[
                  Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Container(
                              height: 400,
                              width: 325,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 80,
                                  ),
                                  Text(
                                    'Log in Admin Account',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 250,
                                    child: TextFormField(
                                      decoration:
                                          InputDecoration(hintText: 'Email'),
                                      validator: (value) => value!.isEmpty
                                          ? 'Email is required'
                                          : validateEmail(value.trim()),
                                      onChanged: (value) {
                                        this.email = value;
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration:
                                          InputDecoration(hintText: 'Password'),
                                      validator: (value) => value!.isEmpty
                                          ? 'Password is required'
                                          : null,
                                      onChanged: (value) {
                                        this.password = value;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        if (checkFields()) {
                                          AuthService().signIn(email, password);
                                        }
                                      },
                                      child: Container(
                                          height: 40.0,
                                          width: 250.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color:
                                                Colors.green.withOpacity(0.2),
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Sign in',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))))
                                ],
                              ))
                        ],
                      ))
                ]))));
  }
}
