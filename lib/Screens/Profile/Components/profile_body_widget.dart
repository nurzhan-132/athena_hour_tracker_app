import 'package:athena_hour_tracker_app/Screens/Profile/Components/profile_background_widget.dart';
import 'package:athena_hour_tracker_app/Screens/Profile/Components/profile_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBodyWidget extends StatefulWidget {
  const ProfileBodyWidget({Key? key}) : super(key: key);

  @override
  _ProfileBodyWidgetState createState() => _ProfileBodyWidgetState();
}

class _ProfileBodyWidgetState extends State<ProfileBodyWidget> {
  final ImagePicker _picker = ImagePicker();
  late PickedFile _imageFile;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ProfileBackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageProfile(),
              const SizedBox(height: 50,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileComponentWidget(
                    navigate: () {},
                    path: "assets/images/a.jpg",
                    text: "Flex Status",
                  ),
                  ProfileComponentWidget(
                    navigate: () {},
                    path: "assets/images/b.jpg",
                    text: "Absence",
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 115,
            backgroundImage: AssetImage('assets/images/profileImage.jpg')
          ),
          Positioned(
            bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet()),
                  );
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.teal,
                  size: 28,
                ),
              ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }




}
