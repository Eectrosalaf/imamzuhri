import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:imamzuhri/screens/forget_password.dart';
import 'package:imamzuhri/utils/constants.dart';
import 'package:imamzuhri/widgets/buttons.dart';

import '../widgets/alert.dart';
import '../widgets/textfield.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

bool isvisible = true;
class _ResetPasswordState extends State<ResetPassword> {
  
//bool isvisible = false;
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
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgetPassword()));
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
                  'Enter New Password',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),

                Text(
                  ' Enter Your New Password',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: DesignColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'New Password',
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
                  hintText: "Enter password",
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

                Text(
                  ' Confirm new password',
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
                  height: 300,
                ),
                Botton(
                  bcolour: Colors.transparent,
                    colour: DesignColors.primaryColor,
                    gradient: const LinearGradient(
                        colors: [Color(0xFF14ADD6), Color(0xFF384295)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    tcolour: Colors.white,
                    title: 'Confirm New Paasword',
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return Notifyalert(
                            onpressed: () {
                               Navigator.pushNamed(
                                        context, '/loginscreen');
                            },
                            title: 'Congratulations',
                            btntitle: 'Back To Sign in',
                            details:
                                'You have successfully changed your password',
                            // controller: _controller,
                            // onsaved: savetask,
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
