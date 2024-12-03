import 'package:flutter/material.dart';
import 'package:stenography_app/common/localization.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('splash ${context.loc.no_comment}'));
  }
}
