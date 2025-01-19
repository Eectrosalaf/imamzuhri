import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:imamzuhri/screens/forget_password.dart';
import 'package:imamzuhri/screens/homescreen.dart';
import 'package:imamzuhri/screens/loginscreen.dart';
import 'package:imamzuhri/screens/onboardingscreen.dart';
import 'package:imamzuhri/screens/signupscreen.dart';
import 'package:imamzuhri/screens/splashscreen.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/splashscreen':(context)=>const SplashScreen(),
         '/homescreen':(context)=>const Homescreen(),
        '/onboarding':(context)=>const OnboardingScreen(),
        '/loginscreen':(context)=>const LoginScreen(),
        '/signupscreen':(context)=>const SignupScreen(),
        '/forgotscreen':(context)=>const ForgetPassword(),

      },
    );
  }
}

