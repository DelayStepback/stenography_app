import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stenography_app/common/router_config.dart';
import 'package:stenography_app/ui/widgets/background_wrapper.dart';
import 'package:stenography_app/ui/widgets/button_sa.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 63),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Flexible(
                          child: Text('С ВОЗВРАЩЕНИЕМ, ШПИОН', style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white, fontSize: 22))),
                      const SizedBox(width: 60),
                      ClipRRect(borderRadius: BorderRadius.circular(50), child: Image.asset('assets/images/avatar.jpg', width: 70, height: 70)),
                    ],
                  ),
                ),
                const Spacer(),
                ButtonSA(
                    text: 'Шифрование медиафайла',
                    onPressed: () {
                      context.push(RouteName.encrypt);
                    }),
                const SizedBox(height: 24),
                ButtonSA(
                    text: 'Извлечение медиафайла',
                    onPressed: () {
                      context.push(RouteName.decrypt);
                    }),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
