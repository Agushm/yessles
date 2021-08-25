part of '../services.dart';

class TeacherServices extends BaseServices {
  static TeacherServices instance = TeacherServices();
  Future<dynamic> getAll(BuildContext context,
      {Map<String, dynamic>? params}) async {
    var res = await request(API.getTeacher, RequestType.GET, context,
        useToken: true, params: params);
    return res;
  }

  Future<dynamic> getById(BuildContext context, int id) async {
    var res = await request(
      API.getTeacherById + '$id',
      RequestType.GET,
      context,
      useToken: true,
    );
    return res;
  }

  Future<dynamic> getByFilter(BuildContext context,
      {String? idMapel,
      String? idJenjang,
      String? idKelas,
      Map<String, dynamic>? params}) async {
    var res = await request(
        API.getTeacherFilter + '$idMapel/$idJenjang/$idKelas',
        RequestType.GET,
        context,
        useToken: true,
        params: params);
    return res;
  }
}
