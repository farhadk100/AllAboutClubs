import 'package:allaboutapps/SharedPreferences/SharedPreferencesManager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Localization.dart';


class LocaleHelper with ChangeNotifier{
  String langCode = 'languageCode';
  late SharedPreferences? sp;
  LocaleHelper(SharedPreferencesManager _sp){
    sp = _sp.sp == null ? null : _sp.sp!;
  }

  getLanguageCode() => langCode;

  //languages code
  final String english = 'en';
  final String deutsch = 'de';


  void setLocale(String languageCode) async {
    sp?.setString('langCode', languageCode);
    langCode = languageCode;
    notifyListeners();
  }

  void getLocale() async {
    langCode = sp?.getString('langCode') ?? 'de';
    notifyListeners();
  }

  Locale _locale(String languageCode) {
    switch (languageCode) {
      case 'en':
        return Locale(english, 'US');
      case 'de':
        return Locale(deutsch, "DE");
      default:
        return Locale(english, 'US');
    }
  }
}


String getTranslated(BuildContext context, String key, {Map<String, String>? placeHolders}) {
  String rawTranslation = Localization.of(context).translate(key)!;
  placeHolders?.forEach((key, value) {
    rawTranslation = rawTranslation.replaceAll('{$key}', value);
  });
  return rawTranslation;
}

