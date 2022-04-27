import 'package:athena_hour_tracker_app/constants.dart';
import 'package:flutter/material.dart';

class Qr extends StatefulWidget {
  const Qr({Key? key}) : super(key: key);

  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<Qr> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("QR"),
      ),
    );
  }
}
