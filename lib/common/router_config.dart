import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stenography_app/ui/features/decrypt/decrypt_screen.dart';
import 'package:stenography_app/ui/features/encrypt/encrypt_screen.dart';
import 'package:stenography_app/ui/features/home/home_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

abstract class RouteName {
  static const String root = '/';
  static const String home = '/homeScreen';
  static const String encrypt = '/encryptScreen';
  static const String decrypt = '/decryptScreen';
  static const String settings = '/settingsScreen';
}

final routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteName.home,
  routes: [
    GoRoute(
      path: RouteName.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RouteName.encrypt,
      builder: (context, state) => const EncryptScreen(),
    ),
    GoRoute(
      path: RouteName.decrypt,
      builder: (context, state) => const DecryptScreen(),
    ),
    // GoRoute(
    //   path: RouteName.settings,
    //   builder: (context, state) => const HomeScreen(),
    // )
  ],
);
