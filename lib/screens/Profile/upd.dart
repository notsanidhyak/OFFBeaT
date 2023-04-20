import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  //const UpdateProfileScreen({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(),icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text("Edit Profile", style: Theme.of (context). textTheme .headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox ( width: 120, height: 120,
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
                      decoration: BoxDecoration (borderRadius: BorderRadius.circular (100), color: Color(0xFFFFE400)),
                      child: const Icon(
                        LineAwesomeIcons.camera,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox (
                  height: 50
              ),
              Form(
                child: Column (
                  children: [
                    TextFormField(
                      decoration: const InputDecoration (
                      ),  // TextFormField

                    ) // Column, Form

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}