import 'package:flutter/material.dart';

class AppbarSA extends StatelessWidget {
  const AppbarSA({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_double_arrow_left, color: Colors.white)),
        const SizedBox(width: 24),
        Text(title, style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white, fontSize: 22)),
      ],
    );
  }
}
