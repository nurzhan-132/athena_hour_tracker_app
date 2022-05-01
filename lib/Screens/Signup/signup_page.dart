import 'package:athena_hour_tracker_app/Screens/Signup/Components/signup_body_widget.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {

  const SignupPage({
    Key? key,
  }) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SignupBodyWidget(),
    );
  }
}