part of '../services.dart';

class ServicePreferances {
  static ServicePreferances instance = ServicePreferances();
  Future saveData(String key, String? json) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json!);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final datane = prefs.getString('token');
    return datane;
  }

  Future<User?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final datane = prefs.getString('userData');
    return datane == 'Null' || datane == null
        ? null
        : User.fromJson(json.decode(datane));
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final datane = prefs.getString('userData');
    if (datane == null) {
      return null;
    } else {
      var d = User.fromJson(json.decode(datane));
      return d.id;
    }
  }

  Future<bool> checkIntro() async {
    final prefs = await SharedPreferences.getInstance();
    final datane = prefs.getString('isShowedIntro');
    if (datane == null) {
      return false;
    } else {
      return true;
    }
  }
}
