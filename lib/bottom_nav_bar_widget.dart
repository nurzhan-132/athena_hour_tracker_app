import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({ Key? key }) : super(key: key);

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  late int currentIndex = 0;
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
          onTap: onTap,
          currentIndex: currentIndex,
          backgroundColor: Color.fromRGBO(25, 29, 33, 1),
          selectedItemColor: Color.fromRGBO(24, 20, 228, 1),
          unselectedItemColor: Color.fromRGBO(255, 255, 255, 1),        
          showUnselectedLabels: false,
          showSelectedLabels: true,
          elevation: 0,          
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromRGBO(232, 238, 243, 1),),
              title: Text("Home"),               
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, color: Color.fromRGBO(232, 238, 243, 1),), 
              title: Text("Calendar"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Color.fromRGBO(232, 238, 243, 1),), 
              title: Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }
}


