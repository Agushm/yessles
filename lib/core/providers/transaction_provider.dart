part of 'providers.dart';

class TransactionProvider with ChangeNotifier {
  Map<String, dynamic>? selectedPaket;
  SchoolLevel? selectedClass;
  Kelas? selectedNumberClass;

  List<Map<String, dynamic>> listPaket = [];
  bool paketInit = true;

  Future getPaket(BuildContext context) async {
    var res = await TransactionServices.instance.getPaket(context);
    if (res != null && res['status'] == 'success') {
      var d = res['data'] as List;
      d.forEach((e) {
        listPaket.add(e);
      });
      selectedPaket = listPaket[0];
    }
    paketInit = false;
    notifyListeners();
  }

  void changeSelectedPaket(Map<String, dynamic> data) {
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
  List<Map> get selectedTeacher => _selectedTeacher;

  void addSelectedTeacher(int index, Teacher teacher) {
    _selectedTeacher[index]['teacher'] = teacher;
    notifyListeners();
  }

  void addSelectedTeachingDays(int index, String data) {
    _selectedTeacher[index]['days'] = data;
    notifyListeners();
  }

  void addSelectedTeachingSession(int index, String data) {
    _selectedTeacher[index]['sesi'] = data;
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
