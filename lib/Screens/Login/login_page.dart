import 'package:flutter/material.dart';
import 'package:athena_hour_tracker_app/Screens/Login/Components/login_body_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBodyWidget(),
    );
  }
}
