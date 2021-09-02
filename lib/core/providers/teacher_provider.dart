part of 'providers.dart';

class TeacherProvider with ChangeNotifier {
  List<Teacher> _teachers = [];
  List<Teacher> get teachers => _teachers;
  bool teacherInit = true;

  Future<List<Teacher>?> getTeacher(BuildContext context,
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
      List<Teacher> _load = [];
      var d = res['data']['docs'] as List;
      d.forEach((e) {
        _teachers.add(Teacher.fromJson(e));
        _load.add(Teacher.fromJson(e));
      });
      return _load;
    }
    teacherInit = false;
    print("teacher INit$teacherInit");
    notifyListeners();
    return [];
  }

  void updateTotalRating(int? teacherId, double? newRating) {
    var index = _teachers.indexWhere((e) => e.id == teacherId);
    _teachers[index].totalRating = newRating;
    notifyListeners();
  }
}
