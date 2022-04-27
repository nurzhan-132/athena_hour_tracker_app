import 'package:athena_hour_tracker_app/Screens/Main-Menu/main_menu_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:athena_hour_tracker_app/constants.dart';
import 'package:athena_hour_tracker_app/Screens/Login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBqJAxrfpB43ZBhK-VP_qS_DdKzJ127Jpg",
        appId: "1:74227861677:android:4d8fb8dfe1f65b5900de24",
        messagingSenderId: "74227861677-osu7b4cvbpd6ukj5o6siq8aoap2sdj2a.apps.googleusercontent.com",
        projectId: "athenatimetracker"
    ),
  );
  runApp(const AthenaWork());
}

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
      home: const LoginCheck(),
    );
  }
}

class LoginCheck extends StatefulWidget {
  const LoginCheck({Key? key}) : super(key: key);

  @override
  _LoginCheckState createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  bool userAvailable = false;
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() async {
    sharedPreferences = await SharedPreferences.getInstance();

    try {
      if(sharedPreferences.getString('employeeId') != null) {
        setState(() {
          userAvailable = true;
        });
      }
    }
    catch(e) {
      setState(() {
        userAvailable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return userAvailable ? const MainMenuPage() : const LoginPage();
  }
}

