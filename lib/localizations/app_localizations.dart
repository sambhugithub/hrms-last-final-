import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Translation {
  Translation(this.appLocale);

  Locale appLocale;

  static Translation? of(BuildContext context) {
    return Localizations.of<Translation>(context, Translation);
  }

  static const LocalizationsDelegate<Translation> delegate =
  _AppLocalizationDelegate();

  Map<String, String>? _localizedStrings;

  Future<bool> load() async {
    final String jsonString = await rootBundle.loadString('Language/${appLocale.languageCode}.json');
    print('Language>>'+jsonString);
    final Map<String, dynamic> jsonLanguageMap = json.decode(jsonString);
    _localizedStrings = jsonLanguageMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String? translate(String jsonkey) {
    return _localizedStrings![jsonkey];
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<Translation> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['fr', 'en'].contains(locale.languageCode);
  }

  @override
  Future<Translation> load(Locale locale) async {
    final Translation localizations = Translation(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Translation> old) {
    return false;
  }
}