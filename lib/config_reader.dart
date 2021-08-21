import 'dart:convert';

import 'package:flutter/services.dart';

abstract class ConfigReader {
  static Map<String, dynamic> _config = {};
  static bool isDev = false;

  static Future<void> initialize(String env) async {
    var configString;
    if (env == 'dev') {
      configString = await rootBundle.loadString('config/dev_app_config.json');
      isDev = true;
    } else {
      configString = await rootBundle.loadString('config/prod_app_config.json');
    }
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getAppName() {
    if (_config['appName'] == null) {
      return "Null";
    }
    return _config['appName'] as String;
  }

  static String getBaseUrl() {
    if (_config['baseUrl'] == null) {
      return "Null";
    }
    return _config['baseUrl'] as String;
  }

  static bool getDev() {
    return isDev;
  }
}
