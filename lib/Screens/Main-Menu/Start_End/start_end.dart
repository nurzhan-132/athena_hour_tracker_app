import 'package:flutter/material.dart';

class StartEnd extends StatefulWidget {
  const StartEnd({Key? key}) : super(key: key);

  @override
  _StartEndState createState() => _StartEndState();
}

class _StartEndState extends State<StartEnd> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Start-End"),
      ),
    );
  }
}
