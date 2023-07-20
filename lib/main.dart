import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_project/controller/routes.dart';
import 'package:flutter_application_project/view/profile.dart';

import 'view/dashboadscreen.dart';
import 'view/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // options: const FirebaseOptions(
  //     apiKey: "AIzaSyCBgInBk3fPGW-7XYIBa3nKct9H8aDv6v8",
  //     authDomain: "hotelproject-1b166.firebaseapp.com",
  //     projectId: "hotelproject-1b166",
  //     storageBucket: "hotelproject-1b166.appspot.com",
  //     messagingSenderId: "158257337632",
  //     appId: "1:158257337632:web:3379bf574b77ec97b93345"));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.pageName,
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: ,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const pageName = "/SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    final user = auth.currentUser;
    if (user != null) {
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ));
      });
    } else {
      Timer(const Duration(seconds: 7), () {
        Navigator.of(context).pushReplacementNamed(HomeScreen.pageName);
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => const HomeScreen(),
        // ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    clientHeight =
        screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Center(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash.jpg"),
                fit: BoxFit.fill)),
      ),
    ));
  }
}
