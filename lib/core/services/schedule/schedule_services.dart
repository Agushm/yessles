part of '../services.dart';

class ScheduleServices extends BaseServices {
  static ScheduleServices instance = ScheduleServices();

  Future<dynamic> getScheduleUser(BuildContext context,
      {String? type, String? userId, Map<String, dynamic>? params}) async {
    var res = await request(API.getScheduleUser, RequestType.GET, context,
        useToken: true, params: params);
    return res;
  }
}
