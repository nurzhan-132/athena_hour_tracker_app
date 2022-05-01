import 'package:athena_hour_tracker_app/Models/user_model.dart';
import 'package:athena_hour_tracker_app/Screens/Login/login_page.dart';
import 'package:athena_hour_tracker_app/Screens/Signup/Components/signup_background_widget.dart';
import 'package:athena_hour_tracker_app/Screens/Widgets/RoundedButtonWidget.dart';
import 'package:athena_hour_tracker_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupBodyWidget extends StatefulWidget {
  const SignupBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SignupBodyWidgetState createState() => _SignupBodyWidgetState();
}

class _SignupBodyWidgetState extends State<SignupBodyWidget> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SignupBackgroundWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "REGISTRATION",
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 190, 199, 1),
                  borderRadius: BorderRadius.circular(29)),
              child: TextFormField(
                autofocus: false,
                controller: _loginController,
                validator: (value) {
                  if(value!.isEmpty || value == null) {
                    return ("Please Enter Your Email");
                  }
                  if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please Enter a valid email");
                  }
                  return null;
                },
                onSaved: (value) {
                  _loginController.text = value!;
                },
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  hintText: "Email",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 190, 199, 1),
                  borderRadius: BorderRadius.circular(29)),
              child: TextFormField(
                controller: _firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid first name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _firstNameController.text = value!;
                },
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  hintText: "First Name",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 190, 199, 1),
                  borderRadius: BorderRadius.circular(29)),
              child: TextFormField(
                controller: _secondNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid second name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _secondNameController.text = value!;
                },
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  hintText: "Second Name",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 190, 199, 1),
                  borderRadius: BorderRadius.circular(29)),
              child: TextFormField(
                controller: _companyNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid company name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _companyNameController.text = value!;
                },
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  hintText: "Company Name",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 190, 199, 1),
                  borderRadius: BorderRadius.circular(29)),
              child: TextFormField(
                controller: _idController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter correct Login';
                  }
                  return null;
                },
                onSaved: (value) {
                  _idController.text = value!;
                },
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  hintText: "ID",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 190, 199, 1),
                  borderRadius: BorderRadius.circular(29)),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  RegExp regex = new RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return ("Password is required for login");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Enter Valid Password(Min. 6 Character)");
                  }
                },
                onSaved: (value) {
                  _firstNameController.text = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                  hintText: "Password",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 190, 199, 1),
                  borderRadius: BorderRadius.circular(29)),
              child: TextFormField(
                autofocus: false,
                controller: _confirmPasswordController,
                obscureText: true,
                validator: (value) {
                  if (_confirmPasswordController.text !=
                      _passwordController.text) {
                    return "Password don't match";
                  }
                  return null;
                },
                onSaved: (value) {
                  _confirmPasswordController.text = value!;
                },
                textInputAction: TextInputAction.done,

                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                  hintText: "Confirm Password",
                  border: InputBorder.none,
                ),
              ),
            ),
            RoundedButtonWidget(
                text: "SIGN UP",
                press: () {signUp(_loginController.text, _passwordController.text);},
                color: kPrimaryColor,
                textColor: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an Account? ",
                  style: TextStyle(
                    color: Color(0xFF6F35A5),
                  ),
                ),
                GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const LoginPage())
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6F35A5),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void checkRegistration() async {
    final form = _formKey.currentState;

    if (!form!.validate()) {
      return;
    }

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ));
  }

    void signUp(String email, String password) async {
      if (_formKey.currentState!.validate()) {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      }
    }

    postDetailsToFirestore() async {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;
      UserModel userModel = UserModel();

      userModel.email = user!.email!;
      userModel.uid = user.uid;
      userModel.firstName = _firstNameController.text;
      userModel.lastName = _secondNameController.text;
      userModel.companyName = _companyNameController.text;
      userModel.id = _idController.text;

      await firebaseFirestore
          .collection("employee")
          .doc(user.uid)
          .set(userModel.toMap());
      Fluttertoast.showToast(msg: "Account created successfully!");

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginPage())
      );
    }
}