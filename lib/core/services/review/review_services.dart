part of '../services.dart';

class RatingServices extends BaseServices {
  static RatingServices instance = RatingServices();

  Future<dynamic> getAll(BuildContext context,
      {String? type, String? userId, Map<String, dynamic>? params}) async {
    var res = await request(
        API.getRating + '$type/$userId', RequestType.GET, context,
        useToken: true, params: params);
    return res;
  }

  Future<dynamic> addRating(BuildContext context,
      {Map<String, dynamic>? data}) async {
    var res = await request(API.addRating, RequestType.POST, context,
        useToken: true, data: data!);
    return res;
  }
}
