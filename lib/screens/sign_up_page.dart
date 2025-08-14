import 'package:buisness_chat/helpers/strings.dart';
import 'package:buisness_chat/widget/custom_button.dart';
import 'package:buisness_chat/helpers/custom_show_snack_bar.dart';
import 'package:buisness_chat/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});
  static String id = "Sign Up";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                          "SignUp ",
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
                    buttonName: "SignUp",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                email: email!,
                                password: password!,
                              );
                          customShowSnackBar(context, msg: "succeeded");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            customShowSnackBar(
                              context,
                              msg: "The Pasword is weak-password",
                            );
                          } else if (e.code == 'email-already-in-use') {
                            customShowSnackBar(
                              context,
                              msg:
                                  "'The account already exists for that email.'",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> signUpUser() async {
  //   UserCredential user = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email!, password: password!);
  // }
}
