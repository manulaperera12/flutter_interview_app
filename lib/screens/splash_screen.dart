import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manula_perera_flutter_interview/components/animated_image.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7000),
    );

    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation completed, navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: AnimatedBuilder(
          animation: _opacityAnimation,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AnimatedMovingImage(
                          imagePath: AssetImage('assets/images/ssimage.png'),
                        ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            'Enjoy the world into \nvirtual reality',
                        textAlign: TextAlign.center,
                            textStyle: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],

                        totalRepeatCount: 1,
                        pause: const Duration(milliseconds: 100),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ],
                ),
              )

            );
          },
        ),
      ),
    );
  }
}