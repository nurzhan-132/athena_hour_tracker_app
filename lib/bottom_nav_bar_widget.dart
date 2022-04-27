// ignore_for_file: prefer_const_constructors

import 'package:athena_hour_tracker_app/constants.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({ Key? key }) : super(key: key);

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  List<IconData> navigationIcons = [
    Icons.home,
    Icons.calendar_month,
    Icons.person,
  ];

  int currIndexOfNav = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 24,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for(int i = 0; i < navigationIcons.length; i++)...<Expanded> {
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currIndexOfNav = i;
                    });
                  },
                  child: Center(
                    child: Icon(
                      navigationIcons[i],
                      color: i == currIndexOfNav ? kPrimaryColor: Colors.black26,
                      size: i == currIndexOfNav ? 30 : 26,

                    ),
                  ),
                ),
              ),
            }
          ],
        ),
      ),
    );
  }


  /*late int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      index = currentIndex;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          currentIndex: currentIndex,
          backgroundColor: Color.fromRGBO(25, 29, 33, 1),
          selectedItemColor: Color.fromRGBO(24, 20, 228, 1),
          unselectedItemColor: Color.fromRGBO(255, 255, 255, 1),        
          showUnselectedLabels: false,
          showSelectedLabels: true,
          elevation: 0,          
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(              
              icon: Icon(Icons.home, color: Color.fromRGBO(232, 238, 243, 1),),
              label: ("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, color: Color.fromRGBO(232, 238, 243, 1),), 
              label: ("Calendar"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Color.fromRGBO(232, 238, 243, 1),), 
              label: ("Profile"),
            ),
          ],
        ),
      ),
    );
  }*/
}


