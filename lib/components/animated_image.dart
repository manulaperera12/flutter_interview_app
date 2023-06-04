import 'package:flutter/material.dart';

class AnimatedMovingImage extends StatefulWidget {
  final ImageProvider imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const AnimatedMovingImage({super.key, required this.imagePath, this.width, this.height, this.fit});

  @override
  _AnimatedMovingImageState createState() => _AnimatedMovingImageState();
}

class _AnimatedMovingImageState extends State<AnimatedMovingImage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _animation = Tween(begin: -15.0, end: 15.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: Image(image: widget.imagePath,
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
      ), // Replace with your image path
    );
  }
}
