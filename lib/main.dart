import 'package:basskhatam/authentication%20pages/google_sign_in.dart';
import 'package:basskhatam/authentication%20pages/home_page.dart';
import 'package:basskhatam/ui/buttons/sign_in.dart';
import 'package:basskhatam/ui/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          //primarySwatch: Colors.blue,
          canvasColor: AppColor.black,
          fontFamily: "Inter",
        ),
        home: const HomePg(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {

    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF131820),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Container(
                  height: height/1.7,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF3366FF),
                          const Color(0xFF00CCFF),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      )
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        SizedBox(height:70),
                        SizedBox(
                          height:70,
                          child: Image.asset("assets/images/image-removebg-preview.png"),
                        ),
                        const SizedBox(height: 10),
                        const Text('One-stop solution for Institutes',
                          style: TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),)
                      ]
                  )
              ),

              // SizedBox(height: 20),
              SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: 30.0, right: 30.0, top: devicePadding.top + 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    // Container(
                    //     height: 200,
                    //     padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    //     child: FlareActor(
                    //       "assets/Teddy.flr",
                    //       shouldClip: false,
                    //       alignment: Alignment.bottomCenter,
                    //       fit: BoxFit.contain,
                    //       controller: _bear_log_inController,
                    //     )),
                    //SizedBox(height: 20),
                    Center(
                      child: Lottie.asset("assets/animations/112545-wumpus-hi.json"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      child: Padding(

                        padding: const EdgeInsets.only(left:30, bottom: 25, right: 30, top:20),
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left:8, bottom: 20, right: 8, top:5),
                                child: Text(
                                  "Login Account",
                                  style: TextStyle(
                                    color: Color(0xFF131820),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                  ),
                                ),
                              ),
                              TextField(
                                //controller: _emailController,
                                style: TextStyle(
                                  color: Color(0xFF131820),
                                  //fontWeight: ,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffEDECED),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff737373)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: 'Email',
                                  border: InputBorder.none,
                                ),
                              ),
                              SizedBox(height:10),
                              TextField(
                                //controller: _passwordController,
                                style: TextStyle(
                                    color: Color(0xFF131820),
                                    //fontWeight: ,
                                    fontSize: 15,
                                ),
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffEDECED),
                                  hintText: 'Password',
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff737373)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),



                              SizedBox(height: 15),
                              MyElevatedButton(
                                width: double.infinity,
                                onPressed: () {},
                                borderRadius: BorderRadius.circular(20),
                                child: Text('SIGN IN',
                                  style: TextStyle(
                                    color: AppColor.white,
                                    //fontWeight: ,
                                    fontSize: 15,
                                  ),),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      height: 1,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  Text('    OR    ',
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,

                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      height: 1,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 15),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  minimumSize: Size(350,50),

                                ),
                                icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                                label: Text("Sign In With Google",
                                  style: TextStyle(
                                    color: AppColor.black,
                                    //fontWeight: ,
                                    fontSize: 13,
                                  ),),
                                // style: TextStyle(
                                //   color: Colors.green,
                                // ),),
                                onPressed: (){
                                  final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
                                  provider.googleLogin();
                                },
                              ),


                              // InkWell(
                              //   child: Container(height: 10,width: 10,color: Colors.red,),
                              //   onTap: () => print("hello"),
                              // ),

                            ],
                          ),
                        ),
                      ),
                    ),
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
