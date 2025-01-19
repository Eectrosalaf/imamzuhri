import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:imamzuhri/screens/reset_password.dart';
import 'package:imamzuhri/utils/constants.dart';
import 'package:imamzuhri/widgets/buttons.dart';

import '../widgets/textfield.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                const SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: DesignColors.primaryColor,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon:  const Icon(
                        Icons.navigate_before,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'Recover password',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter the email address linked to your account, we will send you a link to change your password.',
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
                const CustomTextfield(
                  hintText: "Enter email",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              
                const SizedBox(
                  height: 400,
                ),
                Botton(
                    bcolour: Colors.transparent,
                    colour: DesignColors.primaryColor,
                    gradient: const LinearGradient(
                        colors: [ Color(0xff0d5c58),
                                          Color.fromARGB(255, 21, 168, 161)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    tcolour: Colors.white,
                    title: 'Send Link',
                    onPressed: () {

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPassword()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
