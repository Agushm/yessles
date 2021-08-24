part of '../services.dart';

class MapelServices extends BaseServices {
  static MapelServices instance = MapelServices();
  Future<dynamic> getAll(BuildContext context,
      {Map<String, dynamic>? params}) async {
    var res = await request(API.getMapel, RequestType.GET, context,
        useToken: true, params: params);
    return res;
  }

  Future<dynamic> getById(BuildContext context, int id) async {
    var res = await request(
      API.getMapelById + '$id',
      RequestType.GET,
      context,
      useToken: true,
    );
    return res;
  }

  Future<dynamic> getAllJenjang(BuildContext context,
      {Map<String, dynamic>? params}) async {
    var res = await request(API.getJenjang, RequestType.GET, context,
        useToken: true, params: params);
    return res;
  }
}
