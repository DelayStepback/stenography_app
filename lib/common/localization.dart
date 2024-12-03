import 'package:flutter/material.dart';
import 'package:stenography_app/common/gen/localization/app_localizations.dart';

extension Localization on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}
