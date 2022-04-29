import 'package:athena_hour_tracker_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class StartEnd extends StatefulWidget {
  const StartEnd({Key? key}) : super(key: key);

  @override
  _StartEndState createState() => _StartEndState();
}

class _StartEndState extends State<StartEnd> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                "Employee",
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
                    offset: Offset(2,2),
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
                            "09:05",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: size.width / 18,
                            ),
                          ),
                        ],
                      )
                  ),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "End",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: size.width / 20,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "18:05",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: size.width / 18,
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: "29",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: size.width / 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: " Apr 2022",
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
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "09:05:05 AM",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: size.width / 20,
                  color: Colors.black54,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> key = GlobalKey();

                  return SlideAction(
                    text: "Slide to Start",
                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: size.width / 20,
                      fontFamily: "Inter",
                    ),
                    outerColor: Colors.white,
                    innerColor: kPrimaryColor,
                    key: key,
                    onSubmit: () {
                      key.currentState!.reset();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

  }
}
