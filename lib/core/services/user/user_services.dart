part of '../services.dart';

class UserServices extends BaseServices {
  static UserServices instance = UserServices();

  GoogleServices _g = GoogleServices();

  Future<dynamic> login(BuildContext context) async {
    await _g.signOutGoogle();
    var google = await _g.signGoogle();
    if (google == null) {
      return null;
    } else {
      var fcmToken = await FCMService.instance.fcmToken();
      final res = await request(API.login, RequestType.POST, context, data: {
        'email': google.email,
        'fcmToken': fcmToken,
        'googleId': google.id,
        "latitude": "",
        "longitude": ""
      });
      return {
        "res": res,
        "google": google,
      };
    }
  }

  Future<dynamic> register(
      BuildContext context, Map<String, dynamic> data) async {
    var fcmToken = await FCMService.instance.fcmToken();
    var res = await request(API.register, RequestType.POST, context,
        data: json.encode({
          "google_id": data['google_id'],
          "email": data['email'],
          "password": data['password'],
          "nama_lengkap": data['nama_lengkap'],
          "alamat": data['alamat'],
          "phone": data['phone'],
          "photo_profile": data['photo_profile'],
          "kelamin": data['kelamin'],
          "tanggal_lahir": data['tanggal_lahir'],
          "fcm_token": fcmToken
        }));
    return {'res': res};
  }

  /*Future<dynamic> updateProfile(
      BuildContext context, Map<String, dynamic> data) async {
    var imageURL = data['profileImage'];
    if (data['imageFile'] != null) {
      var uploadImageUrl = await ServiceStorage.uploadImageProfileToFirebase(
          data['imageFile'], data['email']);
      if (uploadImageUrl == null) {
        return {'status': 'error', 'message': 'Gagal upload gambar'};
      } else {
        imageURL = uploadImageUrl;
      }
    }
    var res = await request(API.userProfile, RequestType.PUT, context,
        data: json.encode({
          "email": data['email'],
          "name": data['name'],
          "profileImage": imageURL,
          "phone": data['phone'],
          "address": data['address'],
        }),
        useToken: true);
    return res;
  }

  */
  Future<dynamic> userProfile(BuildContext context) async {
    var res = await request(
      API.userProfile,
      RequestType.GET,
      context,
      useToken: true,
    );
    return res;
  }
}
