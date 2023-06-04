import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturesWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeaturesWidget({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              border: Border.all(
                  style: BorderStyle.solid,
                  width: 2.5,
                  color: Colors.black12)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconTheme(
              data: const IconThemeData(
                size: 27,
              ), child: Icon(icon),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Text(text,
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: 12
            ),
          ),
        )
      ],
    );
  }
}
