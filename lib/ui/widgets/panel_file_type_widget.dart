import 'package:flutter/material.dart';

class PanelFileTypeWidget extends StatelessWidget {
  const PanelFileTypeWidget({super.key, required this.title, required this.onTap, required this.icon, required this.subtitle});

  final String title;
  final VoidCallback onTap;
  final Widget icon;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 174,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(6, 35, 69, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 54, height: 54, child: icon),
              const SizedBox(height: 14),
              Text(title, style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 14),
              Flexible(child: Text(subtitle, style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.grey, fontSize: 12))),
            ],
          ),
        ),
      ),
    );
  }
}
