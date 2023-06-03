import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  //--- Constructor to initialize the Button widget
  const Button({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 37,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.openSans(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
