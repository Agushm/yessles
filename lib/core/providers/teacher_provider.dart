part of 'providers.dart';

class TeacherProvider with ChangeNotifier {
  List<Teacher> _teachers = [];
  List<Teacher> get teachers => _teachers;
  bool teacherInit = true;

  Future getTeacher(BuildContext context,
      {String? idMapel,
      String? idJenjang,
      String? idKelas,
      bool? isRefresh = true}) async {
    if (isRefresh!) {
      _teachers = [];
      teacherInit = true;
    }
    var res = await TeacherServices.instance.getByFilter(context,
        idMapel: idMapel,
        idJenjang: idJenjang,
        idKelas: idKelas,
        params: {
          'page': 1,
          'max': 15,
        });
    if (res != null && res['status'] == 'success') {
      var d = res['data']['docs'] as List;
      d.forEach((e) {
        _teachers.add(Teacher.fromJson(e));
      });
    } else {
      DialogUtils.instance.showInfo(context,
          title: 'Error',
          message: res['message'],
          btnText: 'Tutup', onPressed: () {
        Get.back();
      });
    }
    teacherInit = false;
    print("teacher INit$teacherInit");
    notifyListeners();
  }
}
