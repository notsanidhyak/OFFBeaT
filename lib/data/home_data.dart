import 'package:basskhatam/data/model/subject.dart';
import 'package:basskhatam/ui/theme/app_color.dart';

final List<Subject> subjects = [
  Subject(
    id: 1,
    slug: "cs201",
    name: "CS201",
    desc: "Object Oriented Design & Programming",
    lecturer: "Dr. Pramit Mazumdar",
    image: "assets/images/cs201.png",
    gradient: [AppColor.purpleGradientStart, AppColor.purpleGradientEnd],
  ),
  Subject(
    id: 2,
    slug: "hs201",
    name: "HS201",
    desc: "Technical Writing",
    lecturer: "Dr. Radha Parikh",
    image: "assets/images/hs201.png",
    gradient: [AppColor.cyanGradientStart, AppColor.cyanGradientEnd],
  ),
  Subject(
    id: 3,
    slug: "ec201",
    name: "EC201",
    desc: "Digital Logic Design",
    lecturer: "Dr. Kamal Kishor Jha",
    image: "assets/images/ec201.png",
    gradient: [AppColor.orangeGradientStart, AppColor.orangeGradientEnd],
  ),
  Subject(
    id: 4,
    slug: "ma201",
    name: "MA201",
    desc: "Probability & Statistics",
    lecturer: "Dr. Jignesh Patel",
    image: "assets/images/ma201.png",
    gradient: [AppColor.pinkGradientStart, AppColor.pinkGradientEnd],
  ),
  Subject(
    id: 5,
    slug: "cs203",
    name: "CS203",
    desc: "Design & Analysis of Algorithms",
    lecturer: "Dr. Ashish Phophalia",
    image: "assets/images/cs203.png",
    gradient: [AppColor.purpleGradientStart, AppColor.purpleGradientEnd],
  ),


];
