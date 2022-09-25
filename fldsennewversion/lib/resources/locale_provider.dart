import 'package:flutter/material.dart';
import 'package:fldsenv1/resources/localization_file.dart';

///WIP tried to set the language within the app and need to make some changes for it to work

class LocaleProvider extends ChangeNotifier {

  late Locale _locale;

  Locale get locale =>_locale;

  void setLocale(Locale locale) {
    if(!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale () {
    _locale = null as Locale;
    notifyListeners();
  }
}