part of '../services.dart';

class TransactionServices extends BaseServices {
  static TransactionServices instance = TransactionServices();

  Future<dynamic> getPaket(BuildContext context,
      {String? type, String? userId, Map<String, dynamic>? params}) async {
    var res = await request(API.getPaket, RequestType.GET, context,
        useToken: true, params: params);
    return res;
  }

  Future<dynamic> getSchedule(BuildContext context,
      {String? dayId, String? teacherId, Map<String, dynamic>? params}) async {
    var res = await request(
        API.getSchedule + '$dayId/$teacherId', RequestType.GET, context,
        useToken: true, params: params);
    return res;
  }
}
