import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('ar'); // default Arabic

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!['ar', 'en'].contains(locale.languageCode)) return;
    _locale = locale;
    notifyListeners();
  }

  void toggleLocale() {
    _locale = _locale.languageCode == 'ar' ? const Locale('en') : const Locale('ar');
    notifyListeners();
  }
}
