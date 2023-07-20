import 'package:flutter/material.dart';

import 'loginscreen.dart';
import 'profile.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const pageName = "/HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  // image: AssetImage('assets/images/backgr.jpg'),
                  image: AssetImage('assets/images/hotel.jpg'),
                  fit: BoxFit.fill)),
          child: Column(children: [
            Expanded(
                flex: 5,
                child: LayoutBuilder(
                  builder: (context, boxConstraint) => Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: boxConstraint.maxHeight * 0.15,
                          child: FittedBox(
                            child: Text("Welcome To",
                                style: GoogleFonts.fasthand(
                                  color: Colors.white,
                                )),
                          ),
                        ),

                        // Container(
                        //   height: boxConstraint.maxHeight * 0.4,
                        //   width: boxConstraint.maxWidth * 0.3,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(20),
                        //       color: Colors.white54),
                        //   child: Image.asset('assets/images/pix.png'),
                        // ),
                        // SizedBox(
                        //   height: boxConstraint.maxHeight * 0.1,
                        //   child: const FittedBox(
                        //       child: Text(
                        //     'Hotel',
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white),
                        //   )
                        //   ),
                        // ),
                        SizedBox(
                          height: boxConstraint.maxHeight * 0.15,
                          child: FittedBox(
                            child: Text("Hotel Management System",
                                style: GoogleFonts.fasthand(
                                  color: Colors.white,
                                )),
                          ),
                        ),

                        // SizedBox(
                        //   height: boxConstraint.maxHeight * 0.07,
                        //   child: const FittedBox(
                        //       child: Text(
                        //     'Best hotel deals for your holiday',
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white),
                        //   )),
                        // )

                        // SizedBox(
                        //   height: boxConstraint.maxHeight * 0.12,
                        //   child: FittedBox(
                        //     child: Text('Best hotel deals for your holiday',
                        //         style: GoogleFonts.fasthand(
                        //           color: Colors.white,
                        //         )),
                        //   ),
                        // ),
                      ]),
                )),
            const Spacer(flex: 5),
            Expanded(
              flex: 5,
              child: LayoutBuilder(
                builder: (context, boxConstraint) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // SizedBox(
                      //   height: boxConstraint.maxHeight * 0.2,
                      //   width: boxConstraint.maxWidth * 0.7,
                      //   child: ElevatedButton(
                      //       style: ButtonStyle(
                      //           shape: MaterialStateProperty.all(
                      //               RoundedRectangleBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(25)))),
                      //       onPressed: () {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) => const ProfileScreen(),
                      //             ));
                      //       },
                      //       child: const Text(
                      //         'Get Started',
                      //         style: TextStyle(
                      //             fontSize: 15, fontWeight: FontWeight.bold),
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
                                      color: Colors.white.withOpacity(0.5),
                                      offset: Offset(0, -5)),
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.white.withOpacity(0.5),
                                      offset: Offset(0, 5)),
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.white.withOpacity(0.5),
                                      offset: Offset(-5, 0)),
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.white.withOpacity(0.5),
                                      offset: Offset(5, 0))
                                ],
                                borderRadius: BorderRadius.circular(12)),
                            alignment: Alignment.center,
                            child: Text("Get Started",
                                style: GoogleFonts.fasthand(
                                    color: Colors.white, fontSize: 20))),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ));
                        },
                      ),
                      SizedBox(
                        height: boxConstraint.maxHeight * 0.4,
                        child: InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed(ProfileScreen.pageName),
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => const LoginScreen(),
                          // )),
                          child: const Text(
                            'Already have account?Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
