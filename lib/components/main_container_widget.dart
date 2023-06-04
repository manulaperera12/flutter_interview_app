import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'animated_image.dart';
import 'button.dart';

class MainContainerWidget extends StatefulWidget {
  const MainContainerWidget({Key? key}) : super(key: key);

  @override
  State<MainContainerWidget> createState() => _MainContainerWidgetState();
}

class _MainContainerWidgetState extends State<MainContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 30,
                left: 20,
                right: 100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Improved Controller Design With \nVirtual Reality",
                    style: GoogleFonts.openSans(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.4),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Button(
                    text: "Buy Now!",
                    onPressed: () => debugPrint("Buy Button Clicked!"),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Transform.translate(
            offset: const Offset(95.0, -10), // Set the X and Y offset
            child: Transform.scale(
              scale: .61, // Set the scale factor
              child: const AnimatedMovingImage(
                imagePath: AssetImage("assets/images/vr_main.png"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
