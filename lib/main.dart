import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:palestine/Screens/home_screen/home_screen.dart';
import 'package:get/get.dart';

import 'Screens/signin_screen/sign_in.dart';
import 'Screens/signup_screen/sign_up.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:(user !=null && user.emailVerified)?HomeScreen.screenRoute:HomeScreen.screenRoute,
      routes: {
        LoginScreen.screenRoute:(context)=>LoginScreen(),
        SignupScreen.screenRoute:(context)=>SignupScreen(),
        HomeScreen.screenRoute:(context)=>HomeScreen(),
        // Define other routes here if needed
      },
    );
  }
}

