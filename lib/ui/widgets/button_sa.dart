import 'package:flutter/material.dart';

class ButtonSA extends StatelessWidget {
  const ButtonSA({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(6, 35, 69, 1),
        ),
        child: Center(child: Text(text, style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white, fontSize: 20))),
      ),
    );
  }
}
