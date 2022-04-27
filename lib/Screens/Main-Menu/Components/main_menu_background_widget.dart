import 'package:flutter/material.dart';

class MainMenuBackgroundWidget extends StatelessWidget {
  final Widget child;
  const MainMenuBackgroundWidget({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /*Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              fit: BoxFit.cover,
              //alignment: Alignment.bottomLeft,
              height: size.height * 0.31,
              width: size.width,
            ),
          ),*/
          child,
        ],
      ),      
    );
  }
}