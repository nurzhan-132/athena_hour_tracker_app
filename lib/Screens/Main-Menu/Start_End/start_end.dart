import 'dart:async';

import 'package:athena_hour_tracker_app/Models/user.dart';
import 'package:athena_hour_tracker_app/Models/user_model.dart';
import 'package:athena_hour_tracker_app/Screens/Main-Menu/main_menu_page.dart';
import 'package:athena_hour_tracker_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class StartEnd extends StatefulWidget {
  const StartEnd({Key? key}) : super(key: key);

  @override
  _StartEndState createState() => _StartEndState();
}

class _StartEndState extends State<StartEnd> {

  String start = '--/--';
  String end = '--/--';
  /*@override
  void initState() {
    super.initState();
    _getRecord();
  }*/

  void _getRecord() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("employee")
          .where('id', isEqualTo: Users.username)
          .get();

      DocumentSnapshot snap2 = await FirebaseFirestore.instance
          .collection("employee")
          .doc(snap.docs[0].id)
          .collection("Records")
          .doc(
          DateFormat("dd MMMM yyyy").format(DateTime.now()))
          .get();

      setState(() {
        start = snap2['start'];
        end = snap2['end'];
      });
    }
    catch(e) {
      setState(() {
        start = '--/--';
        end = '--/--';
      });
    }
  }

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("employee")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     /* appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Start-End'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const MainMenuPage())),
        ),
      ),*/
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 32),
              child: Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: size.width / 20,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                /*Users.username*/"${loggedInUser.firstName} ${loggedInUser.lastName}",
                style: TextStyle(
                  fontSize: size.width / 18,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 32),
              child: Text(
                "Today's Status",
                style: TextStyle(
                  fontSize: size.width / 18,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 32),
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    offset: Offset(2, 2),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Start",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: size.width / 20,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        start,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: size.width / 18,
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'End',
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: size.width / 20,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        end,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: size.width / 18,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: DateTime.now().day.toString(),
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: size.width / 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: DateFormat(" MMMM yyyy").format(DateTime.now()),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width / 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat("hh:mm:ss a").format(DateTime.now()),
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: size.width / 20,
                        color: Colors.black54,
                      ),
                    ),
                  );
                }),
            end == '--/--' ? Container(
              margin: EdgeInsets.only(top: 24),
              child: Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> key = GlobalKey();

                  return SlideAction(
                    text: start == '--/--' ? 'Slide to Start' : 'Slide to End',
                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: size.width / 20,
                      fontFamily: "Inter",
                    ),
                    outerColor: Colors.white,
                    innerColor: kPrimaryColor,
                    key: key,
                    onSubmit: () async {
                      Timer(Duration(seconds: 1), () {
                        key.currentState!.reset();
                      });

                      QuerySnapshot snap = await FirebaseFirestore.instance
                          .collection("employee")
                          .where('id', isEqualTo: Users.username)
                          .get();

                      DocumentSnapshot snap2 = await FirebaseFirestore.instance
                          .collection("employee")
                          .doc(snap.docs[0].id)
                          .collection("Records")
                          .doc(
                              DateFormat("dd MMMM yyyy").format(DateTime.now()))
                          .get();

                      print(snap2['start']);
                      try {
                        String start = snap2['start'];

                        setState(() {
                          end = DateFormat('hh:mm').format(DateTime.now());
                        });
                        await FirebaseFirestore.instance
                            .collection("employee")
                            .doc(snap.docs[0].id)
                            .collection("Records")
                            .doc(DateFormat("dd MMMM yyyy")
                                .format(DateTime.now()))
                            .update({
                          "start": start,
                          "end": DateFormat('hh:mm').format(DateTime.now()),
                        });
                      } catch (e) {
                        setState(() {
                          start = DateFormat('hh:mm').format(DateTime.now());
                        });
                        await FirebaseFirestore.instance
                            .collection("employee")
                            .doc(snap.docs[0].id)
                            .collection("Records")
                            .doc(DateFormat("dd MMMM yyyy")
                                .format(DateTime.now()))
                            .set({
                          "start": DateFormat('hh:mm').format(DateTime.now()),
                        });
                      }
                    },
                  );
                },
              ),
            ) : Container(
              child: Text('Woohoo, You have completed this day!'),
            ),
          ],
        ),
      ),
    );
  }
}
