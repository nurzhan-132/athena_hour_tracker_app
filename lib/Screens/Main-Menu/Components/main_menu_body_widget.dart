import 'package:athena_hour_tracker_app/Screens/Main-Menu/Components/main_menu_background_widget.dart';
import 'package:athena_hour_tracker_app/Screens/Main-Menu/Components/main_menu_component_widget.dart';
import 'package:flutter/material.dart';
import '../../../bottom_nav_bar_widget.dart';

class MainMenuBodyWidget extends StatefulWidget {
  const MainMenuBodyWidget({ Key? key }) : super(key: key);

  @override
  State<MainMenuBodyWidget> createState() => _MainMenuBodyWidgetState();
}

class _MainMenuBodyWidgetState extends State<MainMenuBodyWidget> {  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;      
    return MainMenuBackgroundWidget(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainMenuComponentWidget(path: "assets/images/main_menu_qr.jpg", text: "QR-Code",),
              const SizedBox(height: 50.0,),
              MainMenuComponentWidget(path: "assets/images/proxy.jpg", text: "Proxy",),
              const SizedBox(height: 50.0,),
              MainMenuComponentWidget(path: "assets/images/start_end.jpg", text: "Start/End"),
              const Spacer(),              
              const BottomNavBarWidget(),               
            ],
        ),
      ),      
    );
  }
  
}




