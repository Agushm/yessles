part of 'providers.dart';

final mockTeacher = {
  'id': 1,
  'nama': 'Alm Prof. Muhammad Maulana Achmad , S.Kom, M.Kom',
  'alamat': 'Solo Baru',
  'deskripsi':
      """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""",
  'phone': '08123023121***',
  'photo':
      'https://images.pexels.com/photos/6281996/pexels-photo-6281996.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'total_rating': 4.5
};

class TeacherProvider with ChangeNotifier {
  List<Teacher> _teachers = [
    Teacher.fromJson(mockTeacher),
    Teacher.fromJson(mockTeacher),
    Teacher.fromJson(mockTeacher),
    Teacher.fromJson(mockTeacher),
    Teacher.fromJson(mockTeacher),
  ];
  List<Teacher> get teachers => _teachers;
  bool teacherInit = false;

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
    _teachers[index].totalRating = newRating!;
    notifyListeners();
  }
}
