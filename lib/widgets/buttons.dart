import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Botton extends StatelessWidget {
  const Botton(
      {super.key,
      this.colour,
      this.tcolour,
      required this.title,
      required this.onPressed,
      this.gradient, this.bcolour});
  final Color? colour;
  final Color? tcolour;
  final Color? bcolour;
  final String? title;
  final Function()? onPressed;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: gradient, borderRadius: BorderRadius.circular(15)),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
                  width: 0.5,
                  color: DesignColors.primaryColor,
                ),
          surfaceTintColor: DesignColors.primaryColor,
          shadowColor: DesignColors.secondaryColor,
          //elevation: 4,
          backgroundColor: bcolour,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w900,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: tcolour,
          ),
        ),
      ),
    );
  }
}
