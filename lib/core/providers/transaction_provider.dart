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
    _selectedTeacher = [
      null,
      null,
      null,
    ];
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

  List<dynamic> _selectedTeacher = [
    null,
    null,
    null,
  ];
  List<dynamic> get selectedTeacher => _selectedTeacher;

  void addSelectedTeacher(int index, Teacher teacher) {
    _selectedTeacher[index] = teacher;
    notifyListeners();
  }
}
