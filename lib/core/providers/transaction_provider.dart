part of 'providers.dart';

class TransactionProvider with ChangeNotifier {
  Paket? selectedPaket;
  SchoolLevel? selectedClass;
  Kelas? selectedNumberClass;

  List<Paket> listPaket = [];
  bool paketInit = true;

  Future getPaket(BuildContext context) async {
    var res = await TransactionServices.instance.getPaket(context);
    if (res != null && res['status'] == 'success') {
      var d = res['data'] as List;
      d.forEach((e) {
        listPaket.add(Paket.fromJson(e));
      });
      selectedPaket = listPaket[0];
    }
    paketInit = false;
    notifyListeners();
  }

  void changeSelectedPaket(Paket data) {
    selectedPaket = data;

    notifyListeners();
  }

  void changeSelectedClass(SchoolLevel data) {
    selectedClass = data;
    selectedNumberClass = selectedClass!.kelas![0];
    notifyListeners();
  }

  void changeSelectedNumberClass(Kelas data) {
    selectedNumberClass = data;
    notifyListeners();
  }

  List<Mapel> _selectedMapel = [];
  List<Mapel> get selectedMapel => _selectedMapel;

  void cancelTransaction() {
    _selectedMapel = [];
    _selectedTeacher = _selectedTeacher = [
      {
        'teacher': null,
        'day': teachingDays[0],
        'sesi': teachingSession[0],
      },
      {
        'teacher': null,
        'day': teachingDays[0],
        'sesi': teachingSession[0],
      },
      {
        'teacher': null,
        'day': teachingDays[0],
        'sesi': teachingSession[0],
      },
    ];

    notifyListeners();
  }

  void addSelectedMapel(Mapel data) {
    if (_selectedMapel.indexOf(data) != -1) {
      print('Memilih Mapel $data');
      return;
    } else if (_selectedMapel.length == 3) {
      print('Sudah memilih 3 mapel');
      return;
    } else {
      _selectedMapel.add(data);
      notifyListeners();
    }
  }

  List<Map> _selectedTeacher = [
    {
      'teacher': null,
      'day': days[0],
      'sesi': teachingSession[0],
    },
    {
      'teacher': null,
      'day': days[0],
      'sesi': teachingSession[0],
    },
    {
      'teacher': null,
      'day': days[0],
      'sesi': teachingSession[0],
    },
  ];
  List<Map> get selectedTeacher => _selectedTeacher;

  void addSelectedTeacher(
      BuildContext context, int index, Teacher teacher) async {
    _selectedTeacher[index]['teacher'] = teacher;
    var teacherSchedule = await getTeacherSchedule(context,
        teacherId: teacher.id.toString(), dayId: "1");
    Teacher t = _selectedTeacher[index]['teacher'];
    t.jadwal = teacherSchedule;
    notifyListeners();
  }

  Future<List<Schedule>?> getTeacherSchedule(BuildContext context,
      {String? teacherId, String? dayId}) async {
    var res = await TransactionServices.instance
        .getSchedule(context, teacherId: teacherId, dayId: dayId);
    if (res == null) {
      return [];
    } else if (res['status'] == 'success') {
      var d = res['data'] as List;
      List<Schedule> _load = [];
      d.forEach((e) {
        _load.add(Schedule.fromJson(e));
      });
      return _load;
    } else {
      return [];
    }
  }

  Future addSelectedTeachingDays(
      BuildContext context, int index, String data) async {
    var teacher = _selectedTeacher[index]['teacher'];
    var iDays = days.indexOf(data);
    var teacherSchedule = await getTeacherSchedule(context,
        teacherId: teacher.id.toString(), dayId: "${iDays + 1}");
    Teacher t = _selectedTeacher[index]['teacher'];
    t.jadwal = teacherSchedule;
    _selectedTeacher[index]['days'] = data;

    notifyListeners();
  }

  void addSelectedTeachingSession(int index, Schedule data) {
    _selectedTeacher[index]['sesi'] = data;
    notifyListeners();
  }

  bool isGetTeacherInit = true;
  Future getTeachers(BuildContext context) async {
    _selectedMapel.forEach((m) async {
      var _teachers = await Provider.of<TeacherProvider>(context, listen: false)
          .getTeacher(context,
              idMapel: m.id.toString(),
              idJenjang: selectedClass!.id!.toString(),
              idKelas: selectedNumberClass!.id!.toString());
      var index = _selectedMapel.indexOf(m);
      _selectedMapel[index].teachers = _teachers;
    });
    isGetTeacherInit = false;
    notifyListeners();
  }

  // Form 4
  Map? selectedTeachingMode = {
    'mode': teachingMode[0],
    'mode_option': teachingMode[0]['mode_options'][0]
  };

  void changeSelectedTeachingModeName(Map data) {
    selectedTeachingMode!['mode'] = data;
    selectedTeachingMode!['mode_option'] =
        selectedTeachingMode!['mode']['mode_options'][0];
    notifyListeners();
  }

  void changeSelectedTeachingModeOption(String data) {
    selectedTeachingMode!['mode_option'] = data;
    notifyListeners();
  }
  // End Form

}
