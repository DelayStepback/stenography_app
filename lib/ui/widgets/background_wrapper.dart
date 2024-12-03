import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  const BackgroundWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.black,
          ),
        ),
        Positioned(
          bottom: -120,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 190, sigmaY: 190),
            child: Container(
              width: 390,
              height: 255,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(200, 100)),
                shape: BoxShape.rectangle,
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.5,
                  colors: [Color(0xFF13224B), Color(0xFF14306C)],
                  stops: [0.3052, 1.0],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -150,
          right: -200,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 190, sigmaY: 190),
            child: Container(
              width: 329,
              height: 329,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.5,
                  colors: [Color(0xFF6A52A4), Color(0xFF281F3E)],
                  stops: [0.3052, 1.0],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -150,
          right: -200,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 190, sigmaY: 190),
            child: Container(
              width: 329,
              height: 329,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.5,
                  colors: [Color(0xFF6A52A4), Color(0xFF281F3E)],
                  stops: [0.3052, 1.0],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: -30,
          top: -30,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 190, sigmaY: 190),
            child: Container(
              width: 255,
              height: 255,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.5,
                  colors: [Color(0xFF13224B), Color(0xFF101A35)],
                  stops: [0.3052, 1.0],
                ),
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
