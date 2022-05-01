import 'package:flutter/material.dart';

class ProfileComponentWidget extends StatelessWidget {
  var path, text;
  VoidCallback ? navigate;

  ProfileComponentWidget({
    Key? key,
    this.path,
    this.text,
    required this.navigate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: AssetImage(path),
            colorFilter: ColorFilters.greyscale,
            child: InkWell(
              onTap: navigate,
            ),
            width: size.width * 0.4,
            height: size.height * 0.3578,
            fit: BoxFit.fill,
          ),

          Text(
            text,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: "Inter",
            ),
          ),
        ],
      ),
    );
  }
}

class ColorFilters {
  // ignore: prefer_const_constructors
  static final greyscale = ColorFilter.matrix(<double>[
    0.15, 0.3, 0, 0, 0,
    0.15, 0.3, 0, 0, 0,
    0.15, 0.3, 0, 0, 0,
    0, 0, 0, 1, 0
  ]);
}