import 'package:basskhatam/screens/Attendance%20Screens/today_screen.dart';
import 'package:basskhatam/screens/Profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basskhatam/data/home_data.dart';
import 'package:basskhatam/ui/theme/app_color.dart';
import 'package:basskhatam/screens/subject_view.dart';
import 'package:basskhatam/ui/widgets/app_icon_buttton.dart';
import 'package:basskhatam/ui/widgets/assignment_week.dart';
import 'package:basskhatam/ui/widgets/subject_item.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'notice_page.dart';

class Dashboard extends StatelessWidget {
  // const Dashboard({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  int pos(String name){
    int i=0;
    int n = name.length;
    // for(i=0;i<n;i++)
    //   {
    //     if(name.)
    //   }
    return name.indexOf(' ');
  }

  @override
  Widget build(BuildContext context) {
    int val = pos(user.displayName!);
    //debugPrint(val.toString());
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showBarModalBottomSheet(
              context: context,
              animationCurve: Curves.easeInOut,
              backgroundColor: Theme.of(context).canvasColor,
              bounce: true,
              enableDrag: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )),
              builder: (ctx) => Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Join Class",
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        style: const TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter your class code",
                          hintStyle: TextStyle(
                            color: AppColor.grey.withOpacity(
                              0.75,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColor.dark,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 17,
                                backgroundImage: NetworkImage(user.photoURL!),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    user.displayName!,
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  //debugPrint(user.displayName!.toString().substring(0,user.displayName!.indexOf(' '))),
                                  SizedBox(height: 2),
                                  Text(
                                    user.email!,
                                    style: TextStyle(
                                      color: AppColor.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AppIconButton(
                            icon: Icon(
                              Icons.chevron_right,
                              color: AppColor.grey.withOpacity(0.75),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        elevation: 0,
                        highlightElevation: 0,
                        splashColor:
                        Theme.of(context).canvasColor.withOpacity(0.15),
                        highlightColor:
                        Theme.of(context).canvasColor.withOpacity(0.25),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Join Class",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          // Do something & close modal
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          backgroundColor: Theme.of(context).primaryColor,
          splashColor: AppColor.black.withOpacity(0.35),
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Clickable icon
                    AppIconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/schedule.svg",
                        width: 24,
                        height: 24,
                        color: AppColor.white,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TodayScreen()));
                      },
                    ),
                    const SizedBox(width: 12),
                    AppIconButton(
                      icon: Stack(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/notification-fill.svg",
                            width: 24,
                            height: 24,
                            color: AppColor.white,
                          ),
                          Positioned(
                            right: 2,
                            top: 0,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                border: Border.all(
                                  color: Theme.of(context).canvasColor,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(360),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NoticePage()));
                      },
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 17,
                        backgroundImage: NetworkImage(user.photoURL!),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()));
                      },
                    ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(360),
                    //   child: NetworkImage(user.photoURL!)
                    //   // Image.asset(
                    //   //   "assets/images/user.png",
                    //   //   width: 40,
                    //   //   height: 40,
                    //   // ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text:  TextSpan(
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColor.white,
                        ),
                        children: [
                          TextSpan(
                            text: "Welcome ",
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: user.displayName!.substring(0,val),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   'Email: '+user.email!,
                          //   style: TextStyle(fontSize: 16,color: Colors.white),
                          // ),
                          TextSpan(
                              text: " 👋🏼",
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const Text(
                        "Everyday is a change to be better",
                        style: TextStyle(
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "This semester",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(360),
                        splashColor:
                        Theme.of(context).primaryColor.withOpacity(0.25),
                        highlightColor:
                        Theme.of(context).primaryColor.withOpacity(0.4),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            "View all",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Expanded(
                        child: AssignmentWeek(
                          count: 6,
                          subjects: ["CS201, MA201, EC201, HS201"],
                          type: AssignmentType.assigned,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: AssignmentWeek(
                          count: 2,
                          subjects: ["OOPS Project, Android Dev, Web Dev"],
                          type: AssignmentType.missed,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: subjects.length,
                  itemBuilder: (ctx, index) {
                    final subject = subjects[index];

                    // Subject Item
                    return GestureDetector(
                      onTap: () {
                        // Navigate to subject view
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => SubjectView(subject: subject),
                          ),
                        );
                      },
                      child: SubjectItem(subject: subject),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
