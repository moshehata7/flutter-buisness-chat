import 'package:buisness_chat/helpers/strings.dart';
import 'package:buisness_chat/screens/chat_page.dart';
import 'package:buisness_chat/screens/sign_up_page.dart';
import 'package:buisness_chat/widget/custom_button.dart';
import 'package:buisness_chat/helpers/custom_show_snack_bar.dart';
import 'package:buisness_chat/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogInPage extends StatefulWidget {
  LogInPage({super.key});
  static String id = "Sign In";

  @override
  State<LogInPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<LogInPage> {
  String? password;

  String? email;
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColor,
          title: Text("Business Chat", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/image/340133622_971778247319335_5873980980546152985_n.jpg",
                    height: 70,
                  ),
                  Text(
                    "Business Chat",
                    style: TextStyle(
                      color: kColor,
                      fontFamily: "Pacifico",
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "LogIn",
                          style: TextStyle(color: kColor, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintTxt: "Email",
                    secure: false,
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    onChanged: (data) {
                      password = data;
                    },
                    hintTxt: "Password",
                    secure: true,
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    buttonName: "LogIn",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: email!,
                                password: password!,
                              );
                          Navigator.pushNamed(context, ChatPage.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            customShowSnackBar(
                              context,
                              msg: 'No user found for that email.',
                            );
                          } else if (e.code == 'wrong-password') {
                            customShowSnackBar(
                              context,
                              msg: 'Wrong password provided for that user.',
                            );
                          }
                        } catch (e) {
                          customShowSnackBar(context, msg: e.toString());
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont have an account? ",
                        style: TextStyle(color: kColor, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpPage.id);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: kColor, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  
}
