import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../ui/theme/app_color.dart';
import 'dashboard.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.topLeft,
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
            SizedBox(height:140),
            Container(
              alignment: Alignment.center,
              height: 350,width: 350,

              child: Lottie.asset
              ("assets/animations/119866-panda-waving.json")
            ),
            SizedBox(height:15),
            Text("I am working to make this page ready", style: TextStyle(
              color: AppColor.white,
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),),
            // Text("to make this page ready", style: TextStyle(
            //   color: AppColor.white,
            //   fontWeight: FontWeight.w300,
            //   fontSize: 20,
            // ),),
          ],
        ),
      ),
    );
  }
}
