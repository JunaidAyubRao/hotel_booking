import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/view/loginscreen.dart';
import 'package:flutter_application_project/view/profile.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashboadscreen.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});
  static const pageName = "/CreateScreen";

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('CreateAccount'),
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/create.jpg"),
                  fit: BoxFit.fill)),
          child: Column(children: [
            Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // const AutoSizeText(
                        //   'Create Account',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold, fontSize: 15),
                        // ),
                        // const AutoSizeText(
                        //     'Enter your Email and Password\n for sign up.Already have account?',
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.bold, fontSize: 13)),
                        SizedBox(
                          width: screenWidth * 0.8,
                          height: clientHeight * 0.1,
                          child: Form(
                              key: globlekey,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                style: const TextStyle(
                                  color: Colors.white,
                                  decorationColor: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    prefixIconColor: Colors.white,
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    hintText: 'Enter the Address',
                                    hoverColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: const Icon(Icons.home),
                                    focusColor: Colors.white,
                                    iconColor: Colors.white,
                                    hintStyle: const TextStyle(
                                      color: Colors.white,
                                      decorationColor: Colors.white,
                                    ),
                                    labelText: 'Address'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the adress';
                                  } else if (value.isValiedAlpha()) {
                                    return null;
                                  } else {
                                    return 'invalid';
                                  }
                                },
                              )),
                        ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          height: clientHeight * 0.1,
                          child: Form(
                              key: globlekey1,
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                controller: passwordController,
                                style: const TextStyle(
                                  color: Colors.white,
                                  decorationColor: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Enter the Password',
                                    prefixIconColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    fillColor: Colors.white,
                                    labelStyle: TextStyle(color: Colors.white),
                                    focusColor: Colors.white,
                                    iconColor: Colors.white,
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      decorationColor: Colors.white,
                                    ),
                                    labelText: 'Password'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter the password';
                                  } else {}
                                },
                              )),
                        ),
                        InkWell(
                          child: Container(
                              width: screenWidth * 0.75,
                              height: clientHeight * 0.07,
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
                              child: const Center(
                                child: Text('SIGN UP',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              )),
                          onTap: () async {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              Navigator.of(context)
                                  .pushNamed(LoginScreen.pageName);
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => const LoginScreen(),
                              // ));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                      'The password provided is too weak.'),
                                ));
                              } else if (e.code == 'email-already-in-use') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                      'The account already exists for that email.'),
                                ));
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(e.toString()),
                              ));
                            }
                            globlekey.currentState!.validate();
                            globlekey1.currentState!.validate();
                          },
                        ),
                        const AutoSizeText(
                          'By Signing up you agree to our Terms\n Condition and privacy policy',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ]),
                )),
          ]),
        ),
      ),
    );
  }
}

extension validatedDigit on String {
  bool isValiedAlpha() {
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
