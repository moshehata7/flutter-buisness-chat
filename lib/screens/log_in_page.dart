import 'package:buisness_chat/constants/strings.dart';
import 'package:buisness_chat/screens/sign_up_page.dart';
import 'package:buisness_chat/widget/custom_button.dart';
import 'package:buisness_chat/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  static String id = "Log In";

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor,
        title: Text("Business Chat", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
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
                      "Login ",
                      style: TextStyle(color: kColor, fontSize: 20),
                    ),
                  ),
                ],
              ),
              CustomTextField(
                onChanged: (data) {},
                hintTxt: "Email",
                secure: false,
              ),
              SizedBox(height: 10),
              CustomTextField(
                onChanged: (data) {},
                hintTxt: "Password",
                secure: true,
              ),
              SizedBox(height: 10),
              CustomButton(onTap: () {}, buttonName: "LogIn"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "dont have an account ?",
                    style: TextStyle(color: kColor, fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpPage.id);
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: kColor, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
