import 'package:flutter/material.dart';

import 'createscreen.dart';
import 'loginscreen.dart';
import 'package:google_fonts/google_fonts.dart';

late Size screenSize;
late double screenWidth, screenHeight, clientHeight;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const pageName = "/ProfileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    clientHeight =
        screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white38,
          body: SafeArea(
            child: Center(
              child: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/background.jpg"),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    // Expanded(
                    //     flex: 5,
                    //     child: LayoutBuilder(
                    //       builder: (context, boxConstraint) => Image.asset(
                    //         'assets/images/luggage.png',
                    //         height: boxConstraint.maxHeight * 0.5,
                    //         width: boxConstraint.maxWidth * 0.7,
                    //       ),
                    //     )),
                    Expanded(
                        flex: 5,
                        child: LayoutBuilder(
                          builder: (context, boxConstraint) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(
                                //   height: boxConstraint.maxHeight * 0.1,
                                //   width: boxConstraint.maxWidth * 0.5,
                                //   child: const FittedBox(
                                //       child: Text(
                                //     'Find best deals',
                                //     style:
                                //         TextStyle(fontWeight: FontWeight.bold),
                                //   )
                                //   ),
                                // ),
                                SizedBox(
                                  height: boxConstraint.maxHeight * 0.1,
                                  width: boxConstraint.maxWidth * 0.5,
                                  child: FittedBox(
                                    child: Text("Find Best Deals",
                                        style: GoogleFonts.pacifico(
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: boxConstraint.maxHeight * 0.05,
                                  width: boxConstraint.maxWidth * 0.3,
                                ),
                                // SizedBox(
                                //   height: boxConstraint.maxHeight * 0.15,
                                //   width: boxConstraint.maxWidth * 0.6,
                                //   child: const FittedBox(
                                //       child: Text(
                                //     'Find deal for any season from cosy\n country homes to city plan',
                                //     style:
                                //         TextStyle(fontWeight: FontWeight.bold),
                                //   )),
                                // )
                                SizedBox(
                                  height: boxConstraint.maxHeight * 0.15,
                                  width: boxConstraint.maxWidth * 0.6,
                                  child: FittedBox(
                                    child: Text(
                                        'Find deal for any season from cosy\n \t\t\ts\tcountry homes to city plan',
                                        style: GoogleFonts.pacifico(
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ]),
                        )),
                    Expanded(
                        flex: 5,
                        child: LayoutBuilder(
                          builder: (context, boxConstraint) => Image.asset(
                            'assets/images/luggage.png',
                            height: boxConstraint.maxHeight * 0.5,
                            width: boxConstraint.maxWidth * 0.7,
                          ),
                        )),
                    Expanded(
                        flex: 5,
                        child: LayoutBuilder(
                          builder: (context, boxConstraint) => Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // SizedBox(
                                //   height: boxConstraint.maxHeight * 0.2,
                                //   width: boxConstraint.maxWidth * 0.7,
                                //   child: ElevatedButton(
                                //       style: ButtonStyle(
                                //           shape: MaterialStateProperty.all(
                                //               RoundedRectangleBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(
                                //                           25)))),
                                //       onPressed: () {
                                //         Navigator.of(context)
                                //             .pushNamed(LoginScreen.pageName);
                                //         // Navigator.push(
                                //         //     context,
                                //         //     MaterialPageRoute(
                                //         //       builder: (context) =>
                                //         //           const LoginScreen(),
                                //         //     ));
                                //       },
                                //       child: const Text(
                                //         'Login',
                                //         style: TextStyle(
                                //             fontWeight: FontWeight.bold),
                                //       )),
                                // ),

                                InkWell(
                                  child: Container(
                                      height: boxConstraint.maxHeight * 0.2,
                                      width: boxConstraint.maxWidth * 0.7,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                offset: Offset(0, -5)),
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                offset: Offset(0, 5)),
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                offset: Offset(-5, 0)),
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                offset: Offset(5, 0))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      alignment: Alignment.center,
                                      child: Text("Login",
                                          style: GoogleFonts.fasthand(
                                              color: Colors.white,
                                              fontSize: 20))),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(LoginScreen.pageName);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const LoginScreen(),
                                    //     ));
                                  },
                                ),
                                SizedBox(
                                  height: boxConstraint.maxHeight * 0.1,
                                  width: boxConstraint.maxWidth * 0.3,
                                ),
                                // SizedBox(
                                //   height: boxConstraint.maxHeight * 0.2,
                                //   width: boxConstraint.maxWidth * 0.7,
                                //   child: ElevatedButton(
                                //       style: ButtonStyle(
                                //           shape: MaterialStateProperty.all(
                                //               RoundedRectangleBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(
                                //                           25)))),
                                //       onPressed: () {
                                //         Navigator.of(context)
                                //             .pushNamed(CreateScreen.pageName);
                                //         // Navigator.push(
                                //         //     context,
                                //         //     MaterialPageRoute(
                                //         //       builder: (context) =>
                                //         //           const CreateScreen(),
                                //         //     ));
                                //       },
                                //       child: const Text(
                                //         'Create account',
                                //         style: TextStyle(
                                //             fontWeight: FontWeight.bold),
                                //       )),
                                // ),
                                InkWell(
                                  child: Container(
                                      height: boxConstraint.maxHeight * 0.2,
                                      width: boxConstraint.maxWidth * 0.7,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                offset: Offset(0, -5)),
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                offset: Offset(0, 5)),
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                offset: Offset(-5, 0)),
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                offset: Offset(5, 0))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      alignment: Alignment.center,
                                      child: Text("Create Account",
                                          style: GoogleFonts.fasthand(
                                              color: Colors.white,
                                              fontSize: 20))),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(CreateScreen.pageName);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const CreateScreen(),
                                    //     ));
                                  },
                                ),
                                SizedBox(
                                  height: boxConstraint.maxHeight * 0.15,
                                  width: boxConstraint.maxWidth * 0.1,
                                )
                              ]),
                        )),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
