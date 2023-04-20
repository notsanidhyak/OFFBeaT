import 'dart:ui';
import 'package:flutter/material.dart';

class ProductItemScreen2 extends StatelessWidget {
  const ProductItemScreen2({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                //child: Image.asset("assets/imges/Food Picture.png"),
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
              color: Colors.white,
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
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "HS201",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Technical Writing",

                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const Text(
                    'The objectives of this course include understanding the concepts, terms and tools of technical writing; and applying them on various forms of representation like technical reports, projects, research papers, dissertation and thesis. Students will read, analyze, and interpret material from technical fields, and will practice research and writing skills appropriate for technical topics.',
                    style: TextStyle(
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
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      )


                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '1. Students will learn to follow the steps of writing process, i.e., pre-writing, writing, rewriting, and editing, and apply them to technical and workplace writing tasks',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),


                  const SizedBox(
                    height: 3,
                  ),

                  const Text(
                    '2. Students will be able to prepare technical documents including project reports, manuscript preparation for conferences and journals, and drafting reports for availing grants for technical projects',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),


                  const SizedBox(
                    height: 3,
                  ),

                  const Text(
                    '3. Students will be exposed to various software tools (say, LaTeX) for preparing technical documentation and presentation',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ) ,


                  const SizedBox(
                    height: 3,
                  ),

                  const Text(
                    '4. Students will understand the basic components of definitions, descriptions, process explanations, and other common forms of technical writing',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),


                  const SizedBox(
                    height: 3,
                  ),

                  const Text(
                    '5. Students will have an appreciation for some of the ideas, issues, and problems involved in writing about technology and in workplace writing.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                ],
              ),
            ),
          );
        });
  }


}