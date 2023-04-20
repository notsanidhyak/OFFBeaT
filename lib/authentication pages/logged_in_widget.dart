import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:basskhatam/authentication pages/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../screens/dashboard.dart';
import '../ui/buttons/sign_in.dart';
import 'package:get/get.dart';

import '../ui/theme/app_color.dart';

class LoggedInWidget extends StatelessWidget {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Logged In'),
      //   centerTitle: true,
      //   actions: [
      //     TextButton(
      //         onPressed: (){
      //           final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
      //           provider.logout();
      //         },
      //         child: Text('Logout',
      //         style: TextStyle(color: Colors.white),
      //         ),
      //     )
      //   ],
      // ),
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF131820),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 140),
            Text(
              'Profile',
              style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 32),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(height: 8),
            Text(
              'Name: '+user.displayName!,
              style: TextStyle(
              color: AppColor.white,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
            ),
            SizedBox(height: 8),
            Text(
              'Email: '+user.email!,
              style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 100),
            Container(
              height: 200,
              width: 280,
              child: Column(
                children: [
                  Container(
                    width: 200,
                    child: Center(
                      child: Lottie.asset("assets/animations/loggedin.json"),
                    ),
                  ),
                  MyElevatedButton(
                    width: 280,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Text('Continue to Dashboard',
                      style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),),
                  ),
                ],
              ),

            ),
            // Container(
            //   height: 200,
            //   width: 200,
            //   child: Expanded(
            //     child: Center(
            //       child: Lottie.asset("assets/animations/ofb2.json",
            //       //fit: BoxFit.cover
            //         ),
            //     ),
            //   ),
            // ),
            //SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
