import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:ilm_spot/screens/forget_password.dart';
//import 'package:ilm_spot/screens/sign_up.dart';

import '../services/authmethod.dart';
import '../utils/constants.dart';
import '../widgets/alert.dart';
import '../widgets/buttons.dart';
import '../widgets/textfield.dart';
import 'forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isvisible = true;
  bool isdone = false;
  var category = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  'images/zurilogo.png',
                  height: 300,
                  width: 300,
                )),
                Text(
                  'Welcome back',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: DesignColors.primaryColor,
                  ),
                ),
                Text(
                  'Let\'s continue learning',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Email',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                 CustomTextfield(
                  controller: emailController,
                  hintText: "Enter email",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Password',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                    'Your password should have 8 characters, with 1 uppercase and 1 special sign',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 2),
                const SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                  controller: passwordController,
                  hintText: "Enter Password",
                  obscureText: !isvisible,
                  onSuffixIconTapped: () {
                    setState(() {
                      isvisible = !isvisible;
                    });
                  },
                  suffixIcon: Icon(
                    isvisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: DesignColors.primaryColor,
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      activeColor:DesignColors.primaryColor,
                      checkColor: Colors.white,
                        value: isdone,
                        onChanged: (_) {
                          setState(() {
                            isdone = !isdone;
                          });
                        }),
                    Text(
                      'Remember me',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: DesignColors.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 26),
                    GestureDetector(
                      onTap: () {

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgetPassword()));
                      },
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'I forgot my password',
                            style: GoogleFonts.poppins(
                              color: DesignColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          )),
                    ),
                  ],
                ),
                Botton(
                    bcolour: DesignColors.primaryColor,
                    colour: DesignColors.primaryColor,
                    // gradient: const LinearGradient(colors: [
                    //   Color(0xff0d5c58),
                    //   Color.fromARGB(255, 21, 168, 161),
                    // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    tcolour: Colors.white,
                    title: 'Log in',
                    onPressed: () async {
                      String output = await authenticationMethods.signInUser(
                        email: emailController.text,
                        password: passwordController.text,
                      );

                      emailController.clear();

                      passwordController.clear();

                      if (output == 'success') {
                        Navigator.pushNamed(

                            // ignore: use_build_context_synchronously
                            context,
                            '/homescreen');
                      } else {
                        showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) {
                              return AnimatedContainer(
                                duration: const Duration(seconds: 10),
                                curve: Curves.linearToEaseOut,
                                child: Notifyalert(
                                    onpressed: () {
                                      Navigator.pushNamed(
                                          context, '/loginscreen');
                                    },
                                    title: 'Opps!',
                                    btntitle: 'Log in Again',
                                    details: output

                            
                                    ),
                              );
                            });
                      }
                    }),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50, left: 80),
                    child: Row(
                      children: [
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: ' Don\'t have an account ?',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signupscreen');
                          },
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Register',
                                style: GoogleFonts.poppins(
                                  color: DesignColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
