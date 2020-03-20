import 'package:flutter/material.dart';
import 'package:w27/language/strings/de.dart';
import 'package:w27/language/strings/en.dart';

enum Language { EN, DE }

extension LanguageExtension on Language {
  String getString() {
    return this.toString().split('.').last;
  }

  String getCode() {
    switch(this) {
      case Language.EN:
        return 'en';
      case Language.DE:
        return 'de';
      default:
        return null;
    }
  }
}

Map<Language, Map<String,String>> _strings; // holds all the language strings
Language currLocale = Language.EN;

String t(String key, [Map<String, String> data]) {

  String raw = _strings[currLocale][key];

  if(raw == null)
    return null;

  if(data != null) {
    data.forEach((key, value){
      raw = raw.replaceAll('{{$key}}', value);
    });
  }
  return raw;
}

class LanguageHandler {

  static Future<void> load(BuildContext context) async {
    _strings = {};
    for(Language l in Language.values) {
      Map<String, String> result = Map();
      switch(l) {
        case Language.EN:
          _parse("", en, result);
          break;
        case Language.DE:
          _parse("", de, result);
          break;
      }
      _strings[l] = result;
      print('[locale-manager] loaded ${l.getCode()}');
    }
  }

  static void setLocale(String languageCode) {
    currLocale = Language.values.firstWhere((l) => l.getCode() == languageCode, orElse: () => Language.EN);
    print('[locale-manager] set locale to: $currLocale');
  }

  static Language getLocale() {
    return currLocale;
  }

  static void _parse(String prefix, Map<String, dynamic> data, Map<String, String> result) {
    data.forEach((key, value) {
      if(value is String) {
        result[prefix+key] = value;
      } else {
        _parse(prefix+key+".",value, result);
      }
    });
  }
}