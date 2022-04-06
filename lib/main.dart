import 'package:flutter/material.dart';
import 'package:athena_hour_tracker_app/constants.dart';
import 'package:athena_hour_tracker_app/Screens/Login/login_page.dart';

void main() => runApp(const AthenaWork());

class AthenaWork extends StatelessWidget {
  const AthenaWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
