
import 'package:flutter/material.dart';
import 'package:qimma/utils/app_localization.dart';

class AppUtils {
  static String translate(BuildContext context, String key) {
    return AppLocalization.of(context).translate(key);
  }
}