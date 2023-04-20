import 'package:basskhatam/authentication%20pages/Info%20Pages/cs201info.dart';
import 'package:basskhatam/authentication%20pages/Info%20Pages/hs201info.dart';
import 'package:basskhatam/screens/Attendance%20Screens/today_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basskhatam/data/class_data.dart';
import 'package:basskhatam/data/model/subject.dart';
import 'package:basskhatam/data/model/subject_assignment.dart';
import 'package:basskhatam/data/model/subject_stream.dart';
import 'package:basskhatam/ui/theme/app_color.dart';
import 'package:basskhatam/ui/widgets/app_icon_buttton.dart';
import 'package:basskhatam/ui/widgets/assignment_highlight.dart';
import 'package:basskhatam/ui/widgets/assignment_item.dart';
import 'package:basskhatam/ui/widgets/stream_item.dart';
import 'package:basskhatam/ui/widgets/student_item.dart';
import 'package:basskhatam/ui/widgets/subject_post.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SubjectView extends StatefulWidget {
  final Subject subject;

  const SubjectView({Key? key, required this.subject}) : super(key: key);

  @override
  State<SubjectView> createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final subjectStreams =
    streams.where((item) => item.subjectId == widget.subject.id).toList();
    final List<Map<String, dynamic>> menus = [
      {'index': 1, 'icon': Icons.timer, 'title': "Stream"},
      {'index': 2, 'icon': Icons.assignment, 'title': "Assignment"},
      {'index': 3, 'icon': Icons.group, 'title': "Classmates"},
    ];
    final List<Widget> bodies = [
      StreamBody(streams: subjectStreams),
      AssignmentBody(
          assignments: assignments
              .where((item) => item.subjectId == widget.subject.id)
              .toList()),
      const ClassmateBody()
    ];

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  AppIconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/back.svg",
                      width: 24,
                      height: 24,
                      color: AppColor.white,
                    ),
                    onTap: () {
                      // Navigate back
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.subject.name,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.subject.desc,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColor.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppIconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/gmeet.svg",
                          width: 24,
                          height: 24,
                          color: AppColor.white,
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      AppIconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/info.svg",
                          width: 24,
                          height: 24,
                          color: AppColor.white,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductItemScreen1()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Assignment highlight
              Row(
                children: assignments
                    .where((item) => item.subjectId == widget.subject.id)
                    .take(1)
                    .map(
                      (item) => Expanded(
                    child: AssignmentHighlight(
                      assignment: item,
                      onTap: (item) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TodayScreen()));
                      },
                    ),
                  ),
                )
                    .toList(),
              ),
              const SizedBox(height: 32),
              // Menu
              GNav(
                selectedIndex: _activeIndex,
                curve: Curves.easeInOutQuint,
                duration: const Duration(milliseconds: 300),
                haptic: true,
                gap: 8,
                tabMargin: const EdgeInsets.symmetric(horizontal: 8),
                color: AppColor.grey,
                activeColor: Theme.of(context).primaryColor,
                tabBackgroundColor:
                Theme.of(context).primaryColor.withOpacity(0.25),
                onTabChange: (index) {
                  setState(() {
                    _activeIndex = index;

                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuint,
                    );
                  });
                },
                tabs: menus
                    .map(
                      (menu) => GButton(
                    gap: 8,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    icon: menu['icon'],
                    text: menu['title'],
                    textStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
                    .toList(),
              ),
              const SizedBox(height: 16),
              // Post
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _activeIndex = index;
                    });
                  },
                  itemCount: bodies.length,
                  itemBuilder: (ctx, index) => bodies[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StreamBody extends StatelessWidget {
  final List<SubjectStream> streams;

  const StreamBody({Key? key, required this.streams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubjectPost(),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: streams.length,
            itemBuilder: (ctx, index) {
              final stream = streams[index];
              // Stream item
              return StreamItem(stream: stream);
            },
          ),
        ),
      ],
    );
  }
}

class AssignmentBody extends StatelessWidget {
  final List<SubjectAssignment> assignments;

  const AssignmentBody({Key? key, required this.assignments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubjectPost(),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: assignments.length,
            itemBuilder: (ctx, index) {
              final assignment = assignments[index];

              return AssignmentItem(
                assignment: assignment,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ClassmateBody extends StatelessWidget {
  const ClassmateBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: students.length,
            itemBuilder: (ctx, index) {
              final student = students[index];

              return StudentItem(student: student);
            },
          ),
        ),
      ],
    );
  }
}