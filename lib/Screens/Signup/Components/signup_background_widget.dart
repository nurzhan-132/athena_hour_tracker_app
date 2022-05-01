import 'package:flutter/material.dart';

class SignupBackgroundWidget extends StatelessWidget {
  final Widget child;
  const SignupBackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/main_top.png"),
          ),
          Positioned(
            top: 1,
            right: 60,
            child: Image.asset(
              "assets/images/main_center.png",
              width: size.width * 0.3,
            ),
          ),
          /*Positioned(
            bottom: 0,
            //left: 0,
            child: Image.asset("assets/images/main_bottom.png", fit: BoxFit.fill,),
          ),*/
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                bottom: 0,
                child: Image.asset(
                  "assets/images/main_bottom.png",
                  fit: BoxFit.cover,
                  //alignment: Alignment.bottomLeft,
                  height: size.height * 0.31,
                  width: size.width,
                ),
              ),
              child,
            ],
          ),
          child,
        ],
      ),
    );
  }
}