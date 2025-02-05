import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imamzuhri/utils/constants.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    this.colour,
    this.title,
    this.onchanged,
    this.onSuffixIconTapped,
    this.controller,
    this.obscureText,
    this.suffixIcon,
    this.readOnly,
    this.prefixIcon,
    this.inputType,
    this.hintStyle,
    this.hintText,
  });

  final Color? colour;
  final String? title;
  final bool? readOnly;
  final Function(String)? onchanged;
  final Function()? onSuffixIconTapped;

  /// not suppose to be so
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? inputType;
  // final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late FocusNode focusNode;
  bool isInFocus = false;

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
  Widget build(BuildContext context) {
    return TextFormField(
      
        focusNode: focusNode,
        readOnly: widget.readOnly ?? false,
        controller: widget.controller,
        keyboardType: widget.inputType,
        obscureText: widget.obscureText ?? false,
        onChanged: widget.onchanged,
        decoration: InputDecoration(
          hoverColor: const Color(0xff27770B),
          suffixIcon: widget.suffixIcon != null
              ? GestureDetector(
                  onTap: widget.onSuffixIconTapped,
                  child: widget.suffixIcon,
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: widget.prefixIcon,
          labelText: widget.title,
          hintStyle: widget.hintStyle,
          hintText: widget.hintText,
          labelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w400, fontSize: 14, color: widget.colour),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 30.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff9e9c9c), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isInFocus ? DesignColors.primaryColor : Colors.black,
                width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          ),
        ));
  }
}
