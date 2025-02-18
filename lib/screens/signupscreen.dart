import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:ilm_spot/screens/login.dart';
//import 'package:ilm_spot/widget/alert.dart';
//import 'package:ilmspots/widget/dropdown.dart';
//import 'package:country_picker_pro/country_picker_pro.dart';
import '../services/authmethod.dart';
import '../utils/constants.dart';

import '../widgets/alert.dart';
import '../widgets/buttons.dart';
import '../widgets/textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isvisible = true;
  var category = '';
  String selectedcountry = 'Nigeria';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;
  late FocusNode focusNode;
  bool isInFocus = false;

  List<String> categories = ['Beginner', 'Intermediate', "Advanced"];
  String dropdownvalue = 'Item 1';
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isInFocus = true;
        });
      } else {
        setState(() {
          isInFocus = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    categoryController.dispose();
  }

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
                  width: 300,
                  height: 300,
                )),
                Text(
                  'Welcome to',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'AL-IMAAM ZUHRI ACADEMY',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: DesignColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Full name',
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
                  controller: nameController,
                  hintText: "Enter Full name",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
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
                  'Address',
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
                  controller: addressController,
                  hintText: 'Address',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Phone number',
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
                  controller: phoneController,
                  hintText: "Enter phone number",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Category',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),

                
                TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: null,
                    labelText: null,
                    hintStyle: null,
                    hintText: 'category',
                    labelStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2, horizontal: 30.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff9e9c9c), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isInFocus
                              ? DesignColors.primaryColor
                              : Colors.black,
                          width: 1.0),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                    ),
                    hoverColor: const Color(0xff27770B),
                    suffixIcon: PopupMenuButton<String>(
                      icon: const Icon(Icons.keyboard_arrow_down,size: 20,),
                      onSelected: (String value) {
                        categoryController.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return categories
                            .map<PopupMenuItem<String>>((String value) {
                          return PopupMenuItem(
                              value: value, child: Text(value));
                        }).toList();
                      },
                    ),
                  ),
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
                      color: DesignColors.primaryColor),
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 40,
                ),
                Botton(
                    bcolour: DesignColors.primaryColor,
                    colour: DesignColors.primaryColor,
                    // gradient: const LinearGradient(colors: [
                    //   Color(0xff0d5c58),
                    //   Color.fromARGB(255, 21, 168, 161),
                    // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    tcolour: Colors.white,
                    title: 'Register',
                    onPressed: () async {
                      String output = await authenticationMethods.signUpUser(
                        category: categoryController.text,
                        name: nameController.text,
                        email: emailController.text,
                        address: addressController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                      );
                      nameController.clear();
                      emailController.clear();
                      addressController.clear();
                      passwordController.clear();
                      categoryController.clear();
                      phoneController.clear();

                      if (output == 'success') {
                        //print('output');
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
                                  title: 'Congratulations',
                                  btntitle: 'Go to Log in',
                                  details:
                                      'You have successfully Registered your account.',
                                  // controller: _controller,
                                  // onsaved: savetask,
                                ),
                              );
                            });
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
                                          context, '/signupscreen');
                                    },
                                    title: 'Opps!',
                                    btntitle: 'Sign Up Again',
                                    details: output

                                    // controller: _controller,
                                    // onsaved: savetask,
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
                              text: ' Already have account ?',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/loginscreen');
                          },
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: ' Log in',
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
