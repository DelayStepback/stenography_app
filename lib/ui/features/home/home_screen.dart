import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stenography_app/common/router_config.dart';
import 'package:stenography_app/data/datasources/lsb_plugin.dart';
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
                // ButtonSA(
                //   text: 'ТЕСТ',
                //   onPressed: () {
                //     final bytes = pickImage();
                //     bytes.then((value) {
                //       print('files bytes: $value');

                //       if (value == null) {
                //         return;
                //       }
                //       Future<Uint8List> futureResult = LsbPlugin.encode(
                //         Uint8List.fromList(value),
                //         Uint8List.fromList(
                //             [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]),
                //       );

                //       futureResult.then((value) {
                //         print('result ENCODER: ${value}');
                //         setState(() {
                //           newImageBytes = value;
                //         });

                //         LsbPlugin.decode(value).then((value) => print('result DECODER: $value'));
                //       });
                //     });
                //   },
                // ),
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
