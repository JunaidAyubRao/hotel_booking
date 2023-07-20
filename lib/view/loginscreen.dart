import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'createscreen.dart';
import 'dashboadscreen.dart';
import 'forgotpassword.dart';
import 'profile.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const pageName = "/LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globlekey = GlobalKey<FormState>();
  GlobalKey<FormState> globlekey1 = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    clientHeight =
        screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Login'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/login.jpg"),
                  fit: BoxFit.fill)),
          child: Center(
            child: Column(children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                  flex: 6,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Image.asset(
                        //       'assets/images/flutter.png',
                        //       width: screenWidth * 0.1,
                        //       height: screenHeight * 0.1,
                        //     ),
                        //     SizedBox(
                        //       width: screenWidth * 0.15,
                        //       height: screenHeight * 0.1,
                        //       child: const FittedBox(
                        //           child: Text(
                        //         'Hotel',
                        //         style: TextStyle(fontWeight: FontWeight.bold),
                        //       )),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(
                        //   width: screenWidth * 0.15,
                        //   height: screenHeight * 0.1,
                        //   child: FittedBox(
                        //     child: Text("Hotel",
                        //         style: GoogleFonts.caveat(
                        //           color: Colors.white,
                        //         )),
                        //   ),
                        // ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.15,
                          child: Form(
                              key: globlekey,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.white,
                                style: const TextStyle(
                                  color: Colors.white,
                                  decorationColor: Colors.white,
                                ),
                                controller: emailController,
                                decoration: InputDecoration(
                                    prefixIconColor: Colors.white,
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    hintText: 'Enter the Address',
                                    hoverColor: Colors.white,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    fillColor: Colors.white,
                                    border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    prefixIcon: const Icon(Icons.home),
                                    focusColor: Colors.white,
                                    iconColor: Colors.white,
                                    hintStyle: const TextStyle(
                                      color: Colors.white,
                                      decorationColor: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'Address'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the adress';
                                  } else if (value.isValidAlpha()) {
                                    return null;
                                  } else {
                                    return 'invalid';
                                  }
                                },
                              )),
                        ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.15,
                          child: Form(
                              key: globlekey1,
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.white,
                                style: const TextStyle(
                                  color: Colors.white,
                                  decorationColor: Colors.white,
                                ),
                                obscureText: _obscureText,
                                controller: passwordController,
                                decoration: InputDecoration(
                                    hintText: 'Enter the Password',
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    prefixIconColor: Colors.white,
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    hoverColor: Colors.white,
                                    fillColor: Colors.white,
                                    border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    prefixIcon:
                                        const Icon(Icons.remove_red_eye),
                                    focusColor: Colors.white,
                                    iconColor: Colors.white,
                                    hintStyle: const TextStyle(
                                      color: Colors.white,
                                      decorationColor: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        )),
                                    labelText: 'Password'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter the password';
                                  } else {}
                                },
                              )),
                        ),
                        // SizedBox(
                        //   width: screenWidth * 0.3,
                        //   height: screenHeight * 0.07,
                        //   child: InkWell(
                        //     onTap: () => Navigator.of(context)
                        //         .pushNamed(ForgotPassword.pageName),
                        //     //     Navigator.of(context).push(MaterialPageRoute(
                        //     //   builder: (context) => const ForgotPassword(),
                        //     // )),
                        //     child: const FittedBox(
                        //         child: Text(
                        //       'forgot password',
                        //       style: TextStyle(fontWeight: FontWeight.bold),
                        //     )),
                        //   ),
                        // ),

                        // SizedBox(
                        //   width: screenWidth * 0.5,
                        //   height: screenHeight * 0.07,
                        //   child: ElevatedButton(
                        //       onPressed: () async {
                        //         try {
                        //           final credential = await FirebaseAuth.instance
                        //               .signInWithEmailAndPassword(
                        //                   email: emailController.text,
                        //                   password: passwordController.text);
                        //           Navigator.of(context)
                        //               .pushNamed(DashboardScreen.pageName);
                        //           // Navigator.of(context).push(MaterialPageRoute(
                        //           //   builder: (context) => const DashboardScreen(),
                        //           // ));
                        //         } on FirebaseAuthException catch (e) {
                        //           if (e.code == 'user-not-found') {
                        //             ScaffoldMessenger.of(context)
                        //                 .showSnackBar(const SnackBar(
                        //               content:
                        //                   Text('No user found for that email.'),
                        //             ));
                        //           } else if (e.code == 'wrong-password') {
                        //             ScaffoldMessenger.of(context)
                        //                 .showSnackBar(const SnackBar(
                        //               content: Text(
                        //                   'Wrong password provided for that user.'),
                        //             ));
                        //           }
                        //         }

                        //         globlekey.currentState!.validate();
                        //         globlekey1.currentState!.validate();
                        //       },
                        //       child: const Text(
                        //         'Login',
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       )),
                        // )

                        InkWell(
                          child: Container(
                              width: screenWidth * 0.5,
                              height: screenHeight * 0.07,
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
                              child: Text("Login",
                                  style: GoogleFonts.fasthand(
                                      color: Colors.white, fontSize: 20))),
                          onTap: () async {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                              Navigator.of(context)
                                  .pushNamed(DashboardScreen.pageName);
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => const DashboardScreen(),
                              // ));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content:
                                      Text('No user found for that email.'),
                                ));
                              } else if (e.code == 'wrong-password') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                      'Wrong password provided for that user.'),
                                ));
                              }
                            }

                            globlekey.currentState!.validate();
                            globlekey1.currentState!.validate();
                          },
                        ),

                        InkWell(
                          child: Text("Forget Password",
                              style: GoogleFonts.fasthand(
                                  color: Colors.white, fontSize: 20)),
                          onTap: () {
                            () => Navigator.of(context)
                                .pushNamed(ForgotPassword.pageName);
                          },
                        ),
                      ])),
              Expanded(
                  flex: 2,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: screenWidth * 0.6,
                            height: screenHeight * 0.07,
                            child: FittedBox(
                                child: InkWell(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(CreateScreen.pageName),
                                    // Navigator.of(context)
                                    //         .push(MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const CreateScreen(),
                                    //     )),
                                    child: const Text(
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        'New user?Create Account')))),
                      ]))
            ]),
          ),
        ),
      ),
    );
  }
}

extension validateDigit on String {
  bool isValidAlpha() {
    var length = this.length ?? 0;
    if (length != 0) {
      for (var i = 0; i < length; i++) {
        var code = this.codeUnits[i] ?? 0;
        //this is ASCII code for Alpha(capital & small letter)
        if (!(code >= 65 && code <= 90 || code >= 97 && code <= 122)) {
          return false;
        }
      }
      return true;
    }
    return false;
  }
}
