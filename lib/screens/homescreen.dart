import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imamzuhri/utils/constants.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: DesignColors.secondaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            height: 400,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Profile',
                  style: TextStyle(
                    color: DesignColors.activeTextColor,
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                CircleAvatar(
                  radius: 50,
                  child: Image.asset(
                    'images/zurilogo.png',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Olasunkanmi Quadri Abiodun',
                  style: TextStyle(
                    color: DesignColors.activeTextColor,
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Tutor and Manager',
                  style: TextStyle(
                    color: DesignColors.activeTextColor,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: DesignColors.primaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: DesignColors.secondaryColor ,
        onPressed: () {
          FirebaseAuth.instance.signOut();

          Navigator.pushNamed(context, '/loginscreen');
        },
        child: const Icon(
          Icons.logout_rounded,
          color: DesignColors.activeTextColor,
          size: 30,
        ),
      ),
    );
  }
}
