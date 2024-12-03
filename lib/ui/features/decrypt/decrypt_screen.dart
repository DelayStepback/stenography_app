import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stenography_app/ui/features/encrypt/encrypt_screen.dart';
import 'package:stenography_app/ui/features/encrypt/encrypt_vm.dart';
import 'package:stenography_app/ui/widgets/appbar_sa.dart';
import 'package:stenography_app/ui/widgets/background_wrapper.dart';
import 'package:stenography_app/ui/widgets/bottom_sheet_trigger.dart';
import 'package:stenography_app/ui/widgets/panel_file_type_widget.dart';

class DecryptScreen extends StatelessWidget {
  const DecryptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EncryptVm(),
      builder: (context, child) {
        final isLoading = context.select((EncryptVm vm) => vm.isLoading);
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
                    const AppbarSA(title: 'Извлечение медиафайла'),
                    isLoading
                        ? Column(
                            children: [
                              const SizedBox(height: 60),
                              RotateAnimation(child: Image.asset('assets/images/sphere_2.png', width: double.infinity, height: 300)),
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
                                  showBottomSheet(
                                      backgroundColor: const Color.fromRGBO(6, 35, 69, 1),
                                      context: context,
                                      builder: (context) => LayoutBuilder(
                                            builder: (context, constraints) {
                                              return SizedBox(
                                                height: constraints.maxHeight * 0.8,
                                                child: const Column(children: [
                                                  SizedBox(height: 10),
                                                  BottomSheetTrigger(height: 20),
                                                  Text('Выбор медиафайла:', style: TextStyle(color: Colors.white, fontSize: 18)),
                                                  SizedBox(height: 30),
                                                ]),
                                              );
                                            },
                                          ));
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

class GridButtons extends StatelessWidget {
  const GridButtons({
    super.key,
    required this.onTapImage,
    required this.onTapVideo,
    required this.onTapAudio,
  });

  final Function(BuildContext context) onTapImage;
  final Function(BuildContext context) onTapVideo;
  final Function(BuildContext context) onTapAudio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 30,
        childAspectRatio: 0.85,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return PanelFileTypeWidget(
              title: 'Изображение',
              onTap: () => onTapImage(context),
              icon: Image.asset('assets/images/icons/picture_media.png'),
              subtitle: 'Прежде всего, консультация с широким активом',
            );
          case 1:
            return PanelFileTypeWidget(
              title: 'Видео',
              onTap: () => onTapVideo(context),
              icon: Image.asset('assets/images/icons/video_media.png'),
              subtitle: 'Прежде всего, консультация с широким активом',
            );
          case 2:
            return PanelFileTypeWidget(
              title: 'Аудиозапись',
              onTap: () => onTapAudio(context),
              icon: Image.asset('assets/images/icons/voice_media.png'),
              subtitle: 'Прежде всего, консультация с широким активом',
            );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
