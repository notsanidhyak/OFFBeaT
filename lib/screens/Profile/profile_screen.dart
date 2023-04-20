import 'package:basskhatam/authentication%20pages/google_sign_in.dart';
import 'package:basskhatam/main.dart';
import 'package:basskhatam/screens/Profile/upd.dart';
import 'package:basskhatam/screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
//import 'package:basskhatam/upd.dart';
import 'package:basskhatam/ui/widgets/profile_screen_widget.dart';
import 'package:provider/provider.dart';

import '../../ui/theme/app_color.dart';

class ProfileScreen extends StatelessWidget {
  //const ProfileScreen({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      //

      body: SingleChildScrollView(
        child: Container(
          padding:  EdgeInsets.only(top: 30,bottom: 30,left: 20,right: 30),
          child: Column(
            children: [
              SizedBox(height:25),
              Container(
                alignment: Alignment.topLeft,
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    },
                    child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF131820),
                      shape: CircleBorder(
                        //borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),
                ),
              ),
              SizedBox(height:50),
              Stack(
                children: [

                  SizedBox(
                    width: 120, height: 120,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container (
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular (100), color: Color(0xFFFFE400)),
                      child: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: Colors.black,
                          size: 20
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox (height: 10),
              Text (user.displayName!, style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),),
              const SizedBox (height: 5),
              Text (user.email!, style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w300,
              ),),
              const SizedBox(height: 20),
              SizedBox(

                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to( () =>  UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFE400), side: BorderSide.none, shape: const StadiumBorder ()),
                  child: Text("Edit Profile",style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
              const SizedBox(height: 30),
              const Divider (),
              const SizedBox (height: 10),
              //MENU
              ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {}),
              ProfileMenuWidget(title: "Student Details", icon: LineAwesomeIcons.user, onPress: () {}),
              ProfileMenuWidget(title: "Course Management", icon: LineAwesomeIcons.book, onPress: () {}),
              //const Divider(),
              //const SizedBox(height: 10),
              ProfileMenuWidget(title: "Help", icon: LineAwesomeIcons.info, onPress: () {}),
              ProfileMenuWidget (
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage (title: "Hi")),
                      );
                      final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.logout();
                  }
              ),
            ],

          ),

        ),
      ),
    );
  }
}