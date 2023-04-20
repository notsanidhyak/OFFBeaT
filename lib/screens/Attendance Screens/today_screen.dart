import 'package:basskhatam/screens/Attendance%20Screens/percent_indicator.dart';
import 'package:basskhatam/services/location_service.dart';
import 'package:basskhatam/ui/buttons/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:date_format/date_format.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../ui/theme/app_color.dart';
import '../dashboard.dart';

class TodayScreen extends StatefulWidget {
  //const TodayScreen({Key? key}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  String checkIn = '--/--';
  String checkOut = '--/--';
  //double latitude = 0.0;
  //double longitude = 0.0;
  //String location = " ";
  bool tell = false;
  final user = FirebaseAuth.instance.currentUser!;
  Color primary =  Colors.black;
  //String _name = user.displayName!;


  Future createUser(User _user, String id) async {
    final docUser = FirebaseFirestore.instance.collection("Students").doc(id);
    //_user.id = docUser.id;

    final json = _user.toJson();
    await docUser.set(json);
  }

  // void _startLocationService() async {
  //   LocationService().initialize();
  //
  //   LocationService().getLatitude().then((value){
  //     setState(() {
  //       User.lat = value!;
  //       latitude = value!;
  //     });
  //   });

  //   LocationService().getLongitude().then((value){
  //     setState(() {
  //       User.long = value!;
  //       longitude = value!;
  //     });
  //   });
  // }

  // void _getLocation() async {
  //   List<Placemark> placemark = await placemarkFromCoordinates(latitude, longitude);
  //
  //   setState(() {
  //     location = "${placemark[0].street},${placemark[0].administrativeArea},${placemark[0].postalCode},${placemark[0].country}";
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _getRecord();
    //_startLocationService();
  }

  void _getRecord() async {
    try{

    } catch(e) {

    }
  }

  @override
  Widget build(BuildContext context) {

    String name = user.displayName!;
    String id = user.email!.toString().substring(0,10);

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height:60),
              Container(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Row(
                    children: [
                      ElevatedButton(
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
                      //Spacer(),
                      Text("             CS201", style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(height:60),
              Center(
                child: Container(
                  //alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top:32),
                  child: Text(
                    "Today's Status ",
                      style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                      )
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top:32, bottom: 32),
                height: 150,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Text(
                            "Check IN",
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth/18 ,
                            ),
                          ),
                          Text(
                            checkIn,
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth/18 ,
                            ),
                          ),
                        ],

                      ),


                    ),
                    Expanded(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Text(
                            "Check OUT",
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth/18 ,
                            ),
                          ),
                          Text(
                            checkOut,
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth/18 ,
                            ),
                          ),
                        ],

                      ),


                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: DateTime.now().day.toString(),
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth/22 ,
                        ),
                        children: [
                          TextSpan(
                              text: DateFormat(' MMMM yyyy').format(DateTime.now()),
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth/22 ,
                            ),

                          )
                        ]
                    ),
                  )
              ),

              StreamBuilder(
                  stream: Stream.periodic(const Duration(seconds: 1)),
                  builder: (context, snapshot) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        DateFormat('hh:mm:ss a').format(DateTime.now()),

                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth/18 ,
                        ),
                      ),
                    );
                  }
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(top: 24),


                child: Builder(
                    builder: (context) {
                      final GlobalKey<SlideActionState> key = GlobalKey();

                      return SlideAction(
                        text: "Slide to check in",
                        textStyle: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth/22 ,
                      ),
                        outerColor: Colors.white,
                        innerColor: primary,
                        key: key,
                        onSubmit: () async  {
                          try{
                            key.currentState!.reset();
                            //_getLocation();
                            print(DateFormat('hh:mm').format(DateTime.now()),);
                            checkIn = DateFormat('hh:mm').format(DateTime.now());
                            final cre_user = User(
                              name: user.displayName!,
                              id: user.email!.toString().substring(0,9),
                              checkin: checkIn, checkout: '',
                              //location: location,
                              //checkout: '--/--';
                            );
                            createUser(cre_user,user.email!.toString().substring(0,9));
                            setState(() {
                              checkIn = DateFormat('hh:mm').format(DateTime.now());
                            });
                            // print(snap.docs[0].id);
                          } catch(e){
                            setState(() {
                              checkIn = '--/--';
                            });
                          }
                        },
                      );
                    }
                ),


              ),
              Container(
                margin: EdgeInsets.only(top: 24),


                child: Builder(
                    builder: (context) {
                      final GlobalKey<SlideActionState> key = GlobalKey();

                      return SlideAction(
                        text: "Slide to check out",
                        textStyle: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth/22 ,
                      ),
                        outerColor: Colors.white,
                        innerColor: primary,
                        key: key,
                        onSubmit: () async  {
                          try{
                            tell = true;
                            key.currentState!.reset();
                            print(DateFormat('hh:mm').format(DateTime.now()),);
                            checkOut = DateFormat('hh:mm').format(DateTime.now());
                            // final cre_user = User(
                            //   name: user.displayName!,
                            //   id: user.email!.toString().substring(0,10),
                            //   checkin: checkIn, checkout: '',
                            //   //checkout: '--/--';
                            // );
                            // createUser(cre_user);
                            final docUser = FirebaseFirestore.instance.
                            collection("Students").doc(user.email!.toString().substring(0,9));

                            docUser.update({'checkOut': checkOut,});
                            setState(() {
                              checkOut = DateFormat('hh:mm').format(DateTime.now());
                            });
                            //print(snap.docs[0].id);
                          }catch(e){
                            setState(() {
                              checkOut = '--/--';
                            });
                          }
                        },
                      );
                    }
                ),


              ),
              SizedBox(height: 45),
              MyElevatedButton(
                width: 270,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PercentageIndicator()),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Text("View Month's Attendance Percent",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,),
              ),
              ),
              // SizedBox(
              //   child: Text(
              //     tell==true?location:"",
              //   ),
              // )
            ],
          ),
        )
    );


  }

}

class User {
  String id;
  final String name;
  final String checkin;
  final String checkout;
  // static double lat = 0.0;
  // static double long = 0.0;
  //static double lat = 0.0;
  //static double long = 0.0;
  //final String location;

  User({
    this.id = '',
    required this.name,
    required this.checkin,
    required this.checkout,
    //required this.lat,
    //required this.long,
    //required this.location,
  });
  final user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic> toJson() => {
    'id': user.email.toString().substring(0,9),
    'name': user.displayName!,
    'checkIn': checkin,
    'checkOut': checkout,
    //'latitude' : lat,
    //'longitude' : long,
    //'location' : location,
  };

// static User fromJson(Map<String,dynamic> json) => User(
//   id: json['id'],
//   name: json['']
// )
}

