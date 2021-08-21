part of 'providers.dart';

class UserProvider with ChangeNotifier {
  GoogleServices _g = GoogleServices();
  User? _user;
  User? get user => _user!;

  UserProvider() {
    setup();
  }

  void setup() async {
    User? u = await ServicePreferances.instance.getUserData();
    _user = u;
    notifyListeners();
  }

  void logout(BuildContext context) {
    _user = null;
    ServicePreferances.instance.saveData('token', 'Null');
    ServicePreferances.instance.saveData('userData', 'Null');
    _g.signOutGoogle();
  }

  Future register(BuildContext context, Map<String, dynamic> data) async {
    DialogUtils.instance.showLoading(context, 'Mohon menunggu...');
    var res = await UserServices.instance.register(context, data);
    Get.back();
    if (res['res']['status'] == 'success') {
      _user = User.fromJson(res['res']['data']);
      ServicePreferances.instance.saveData('token', res['res']['jwt_token']);
      ServicePreferances.instance.saveData('userData', json.encode(_user));
      Get.offAll(MainPage());
    } else if (res['res']['status'] == 'error' && res['res']['code'] == 400) {
      DialogUtils.instance.showInfo(context,
          title: 'Gagal Register',
          message: res['res']['message'],
          btnText: 'Tutup', onPressed: () {
        _g.signOutGoogle();
        Get.back();
        Get.back();
      });
    } else {
      DialogUtils.instance.showInfo(context,
          title: 'Gagal Register',
          message: res['res']['message'],
          btnText: 'Tutup', onPressed: () {
        Get.back();
      });
    }
  }

  Future login(BuildContext context) async {
    DialogUtils.instance.showLoading(context, 'Mohon menunggu...');
    final res = await UserServices.instance.login(context);
    Get.back();
    if (res == null) {
      return null;
    }
    if (res['res']['status'] == 'success') {
      _user = User.fromJson(res['res']['data']);
      ServicePreferances.instance.saveData('token', res['res']['jwt_token']);
      ServicePreferances.instance.saveData('userData', json.encode(_user));
      Get.offAll(MainPage());
    }

    if (res['res']['code'] == 404 && res['res']['message'].contains('email')) {
      DialogUtils.instance.showInfo(context,
          title: 'Email belum terdaftar',
          message: res['res']['message'],
          btnText: 'Daftar Sekarang', onPressed: () {
        Get.back();
        Get.to(RegisterPage(googleAccount: res['google']));
      });
      return null;
    }
    if (res['res']['status'] == 'error') {
      DialogUtils.instance.showInfo(context,
          title: 'Gagal login',
          message: res['res']['message'],
          btnText: 'Tutup', onPressed: () {
        Get.back();
      });
      return null;
    } else {
      return null;
    }
  }

  Future loginPhone(BuildContext context, Map data) async {
    DialogUtils.instance.showLoading(context, 'Mohon menunggu...');
    final res = await UserServices.instance.loginPhone(context, data);
    Get.back();
    if (res == null) {
      return null;
    } else if (res['res']['status'] == 'success') {
      _user = User.fromJson(res['res']['data']);
      ServicePreferances.instance.saveData('token', res['res']['jwt_token']);
      ServicePreferances.instance.saveData('userData', json.encode(_user));
      Get.offAll(MainPage());
    } else if (res['res']['status'] == 'error') {
      DialogUtils.instance.showInfo(context,
          title: 'Gagal login',
          message: res['res']['message'],
          btnText: 'Tutup', onPressed: () {
        Get.back();
      });
    } else {
      return null;
    }
  }

  void getUserProfile(BuildContext context) async {
    var res = await UserServices.instance.userProfile(context);
    if (res != null && res['status'] == 'success') {
      _user = User.fromJson(res['data']);
      ServicePreferances.instance.saveData('userData', json.encode(_user));
      notifyListeners();
    }
  }
}
