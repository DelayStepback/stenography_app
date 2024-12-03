import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stenography_app/ui/features/decrypt/decrypt_screen.dart';
import 'package:stenography_app/ui/features/encrypt/encrypt_vm.dart';
import 'package:stenography_app/ui/widgets/appbar_sa.dart';
import 'package:stenography_app/ui/widgets/background_wrapper.dart';

class EncryptScreen extends StatelessWidget {
  const EncryptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EncryptVm(),
      builder: (context, child) {
        final isLoading = context.select((EncryptVm vm) => vm.isLoading);
        final vm = context.read<EncryptVm>();
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: BackgroundWrapper(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70),
                    const AppbarSA(title: 'Шифрование медиафайла'),
                    isLoading
                        ? Column(
                            children: [
                              const SizedBox(height: 60),
                              RotateAnimation(child: Image.asset('assets/images/sphere.png', width: double.infinity, height: 300)),
                              const SizedBox(height: 50),
                              const Text('Подождите немного\nИдет обработка файла...', style: TextStyle(color: Colors.white, fontSize: 18)),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 50),
                              const Text('Выбор медиафайла:', style: TextStyle(color: Colors.white, fontSize: 18)),
                              GridButtons(
                                onTapImage: (context) {
                                  vm.getLostData();
                                  // showBottomSheet(
                                  //     backgroundColor: const Color.fromRGBO(6, 35, 69, 1),
                                  //     context: context,
                                  //     builder: (context) => LayoutBuilder(
                                  //           builder: (context, constraints) {
                                  //             return SizedBox(
                                  //               height: constraints.maxHeight * 0.8,
                                  //               child: const Column(children: [
                                  //                 SizedBox(height: 10),
                                  //                 BottomSheetTrigger(height: 20),
                                  //                 Text('Выбор медиафайла:', style: TextStyle(color: Colors.white, fontSize: 18)),
                                  //                 SizedBox(height: 30),
                                  //               ]),
                                  //             );
                                  //           },
                                  //         ));
                                },
                                onTapVideo: (context) {},
                                onTapAudio: (context) {},
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RotateAnimation extends StatefulWidget {
  const RotateAnimation({super.key, required this.child});

  final Widget child;

  @override
  _RotateAnimationState createState() => _RotateAnimationState();
}

class _RotateAnimationState extends State<RotateAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _controller.repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller); // Fixed the issue here
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.child,
    );
  }
}
