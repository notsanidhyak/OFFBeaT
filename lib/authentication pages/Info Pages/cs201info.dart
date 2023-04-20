import 'dart:ui';
import 'package:flutter/material.dart';

import '../../ui/theme/app_color.dart';

class ProductItemScreen1 extends StatelessWidget {
  const ProductItemScreen1({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body: Stack(
            children: [
              Container(
                // height: 500,
                // width: 500,
                // child: SizedBox(
                //   // width: 500,
                //   // height: 500,
                //   child: Image.asset("assets/images/csi.jpg"),
                // ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/csi.jpg"),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              buttonArrow(context),
              scroll(),
            ],
          ),
        ));
  }


  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: AppColor.black,
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "CS201",
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Object Oriented Design and Programming",

                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 25,
                    ),

                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const Text(
                    'This course introduces basic concepts of object-oriented programming principles, design techniques, and analysis tools.',
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  const Text(
                      "Learning Outcomes",
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 23,
                    ),


                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'On completion of this course the student should be able to design and analyze real-world problems based on object-oriented principles',
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 20
                    ),
                  )

                ],
              ),
            ),
          );
        });
  }

}
