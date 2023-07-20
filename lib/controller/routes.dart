import 'package:flutter/material.dart';
import 'package:flutter_application_project/view/createscreen.dart';
import 'package:flutter_application_project/view/dashboadscreen.dart';
import 'package:flutter_application_project/view/forgotpassword.dart';
import 'package:flutter_application_project/view/homescreen.dart';
import 'package:flutter_application_project/view/hotelscreen.dart';
import 'package:flutter_application_project/view/loginscreen.dart';
import 'package:flutter_application_project/view/profile.dart';

import '../main.dart';

Route onGenerateRoute(RouteSettings settings) {
  if (settings.name == SplashScreen.pageName) {
    return MaterialPageRoute(
      builder: (context) => const SplashScreen(),
    );
  } else if (settings.name == HomeScreen.pageName) {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    );
  } else if (settings.name == ProfileScreen.pageName) {
    return ScaleFadeTransition(page: const ProfileScreen(), settings: settings);
  } else if (settings.name == LoginScreen.pageName) {
    return MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    );
  } else if (settings.name == CreateScreen.pageName) {
    return ScaleFadeTransition(page: const CreateScreen(), settings: settings);
  } else if (settings.name == ForgotPassword.pageName) {
    return MaterialPageRoute(
      builder: (context) => const ForgotPassword(),
    );
  } else if (settings.name == DashboardScreen.pageName) {
    return MaterialPageRoute(
      builder: (context) => const DashboardScreen(),
    );
  } else {
    return MaterialPageRoute(
      builder: (context) => const HotelDetailScreen(),
    );
  }
}

class ScaleFadeTransition extends PageRouteBuilder {
  ScaleFadeTransition({required this.page, RouteSettings? settings})
      : super(
            pageBuilder: (context, animation, reverseAnimation) => page,
            transitionDuration: const Duration(seconds: 1),
            reverseTransitionDuration: const Duration(seconds: 1),
            settings: settings,
            transitionsBuilder: (context, animation, reverseAnimation, child) =>
                FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                        parent: animation, curve: Curves.bounceInOut),
                    child: child,
                  ),
                ));

  final Widget page;
}
