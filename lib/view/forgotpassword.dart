import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/view/profile.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  static const pageName = "/ForgotScreen";

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailEditingController = TextEditingController();
  GlobalKey<FormState> globlekey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
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
        appBar: AppBar(title: const Text('Forgot Password'), centerTitle: true),
        body: Center(
          child: Expanded(
            flex: 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.8,
                    height: clientHeight * 0.1,
                    child: Form(
                        key: globlekey,
                        child: TextFormField(
                          controller: emailEditingController,
                          decoration: const InputDecoration(
                              hintText: 'Enter the Address',
                              labelText: 'Address'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the adress';
                            } else if (value.isValiedAlph()) {
                              return null;
                            } else {
                              return 'invalid';
                            }
                          },
                        )),
                  ),
                  SizedBox(
                      width: screenWidth * 0.5,
                      height: clientHeight * 0.07,
                      child: ElevatedButton(
                          onPressed: () {
                            auth
                                .sendPasswordResetEmail(
                                    email:
                                        emailEditingController.text.toString())
                                .then((value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          'We have send you email to recovery password,please check email'),
                                    )))
                                .onError((error, stackTrace) =>
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Plese enter the email'),
                                    )));
                            globlekey.currentState!.validate();
                          },
                          child: const Text('Forgot')))
                ]),
          ),
        ),
      ),
    );
  }
}

extension validatedDigi on String {
  bool isValiedAlph() {
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
