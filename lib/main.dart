import 'package:buisness_chat/firebase_options.dart';
import 'package:buisness_chat/screens/log_in_page.dart';
import 'package:buisness_chat/screens/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BusinessChat());
}
class BusinessChat extends StatelessWidget {
  const BusinessChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LogInPage.id : (context)=> LogInPage(),
        SignUpPage.id :(context)=>SignUpPage()
      },
      initialRoute:LogInPage.id,
    );
  }
}
