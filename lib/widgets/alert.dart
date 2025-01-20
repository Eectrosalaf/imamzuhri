import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
import 'buttons.dart';

class Notifyalert extends StatelessWidget {
  const Notifyalert(
      {super.key,
      required this.onpressed,
      required this.title,
      required this.btntitle,
      required this.details});

  final Function()? onpressed;
  final String? details;
  final String? title;
  final String? btntitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(30),
        backgroundColor: const Color.fromARGB(255, 237, 238, 241),
        content: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('images/zurilogo.png',cacheHeight: 100,cacheWidth: 100,),
              
              Text(
                title!,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                details!,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Botton(
                  bcolour: Colors.transparent,
                  colour: DesignColors.primaryColor,
                  gradient: const LinearGradient(colors: [
                    Color(0xff0d5c58),
                    Color.fromARGB(255, 21, 168, 161),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  tcolour: Colors.white,
                  title: btntitle!,
                  onPressed: onpressed),
            ],
          ),
        ),
      ),
    );
  }
}
