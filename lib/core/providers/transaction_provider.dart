part of 'providers.dart';

class TransactionProvider with ChangeNotifier {
  Map? selectedPaket;
  Map? selectedClass;
  String? selectedNumberClass;

  TransactionProvider() {
    selectedPaket = transactionPaket[0];
    selectedClass = transactionClass[0];
    selectedNumberClass = selectedClass!['list_class'][0];
  }

  void changeSelectedPaket(Map data) {
    selectedPaket = data;

    notifyListeners();
  }

  void changeSelectedClass(Map data) {
    selectedClass = data;
    selectedNumberClass = selectedClass!['list_class'][0];
    notifyListeners();
  }

  void changeSelectedNumberClass(String data) {
    selectedNumberClass = data;
    notifyListeners();
  }

  List<Map> _selectedMapel = [];
  List<Map> get selectedMapel => _selectedMapel;

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

  void addSelectedMapel(Map data) {
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
