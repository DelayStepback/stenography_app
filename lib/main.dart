import 'package:flutter/material.dart';
import 'package:stenography_app/common/enums/locale_enum.dart';
import 'package:stenography_app/common/gen/localization/app_localizations.dart';
import 'package:stenography_app/common/router_config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfig,
      localizationsDelegates: const [
        AppLocalizations.delegate,
      ],
      locale: Locale(
        LocaleEnum.en.name,
      ),
      supportedLocales: [
        Locale(LocaleEnum.en.name), // English
        Locale(LocaleEnum.ru.name), // Russian
      ],
    );
  }
}
