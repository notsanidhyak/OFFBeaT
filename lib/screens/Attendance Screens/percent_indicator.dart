import 'package:basskhatam/screens/Attendance%20Screens/today_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../ui/theme/app_color.dart';

class PercentageIndicator extends StatefulWidget {
  const PercentageIndicator({Key? key}) : super(key: key);

  @override
  State<PercentageIndicator> createState() => _PercentageIndicatorState();
}

class _PercentageIndicatorState extends State<PercentageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,

          child: Column(

            children: [
              SizedBox(height: 50),
              Container(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TodayScreen()),
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
              SizedBox(height:110),
              Center(
                child: Text("This Month's",
                  style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),),
              ),
              Center(
                child: Text("Attendance Percent",
                  style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.w600,
                      fontSize: 30
                  ),),
              ),
              SizedBox(height:80),
              Center(
                child: CircularPercentIndicator(
                    radius: 300,
                    lineWidth: 60,
                    animation: true,
                    animationDuration: 3000,
                    percent: 0.75,
                  progressColor: Color(0xFFFFE400),
                  backgroundColor: Colors.white,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text("75%",style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 50,
                  ),),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
