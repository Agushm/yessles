part of 'providers.dart';

class MapelProvider with ChangeNotifier {
  List<Mapel> _mapel = [];

  List<Mapel> get mapelHome => _mapel;
  List<Mapel> mapel(BuildContext context) {
    var jenjang = Provider.of<TransactionProvider>(context, listen: false)
        .selectedClass!
        .jenjang!;
    if (jenjang.toLowerCase() == 'sd') {
      return _mapel.where((e) => e.nama!.toLowerCase() == 'sd').toList();
    } else {
      return _mapel;
    }
  }

  bool mapelInit = true;

  Future getMapel(BuildContext context, {bool isRefresh = false}) async {
    if (isRefresh) {
      _mapel = [];
      mapelInit = true;
    }
    var res = await MapelServices.instance
        .getAll(context, params: {'page': 1, 'max': 20});
    if (res != null && res['status'] == 'success') {
      var d = res['data']['docs'] as List;
      d.forEach((e) {
        _mapel.add(Mapel.fromJson(e));
      });
      notifyListeners();
    }
    mapelInit = false;
  }

  List<SchoolLevel> _schoolLevel = [];
  List<SchoolLevel> get schoolLevel => _schoolLevel;
  bool schoolLevelInit = true;

  Future getSchoolLevel(BuildContext context) async {
    var res = await MapelServices.instance.getAllJenjang(context);
    if (res != null && res['status'] == 'success') {
      var d = res['data'] as List;
      List<SchoolLevel> _load = [];
      d.forEach((e) {
        _load.add(SchoolLevel.fromJson(e));
      });
      _schoolLevel = _load;
      Provider.of<TransactionProvider>(context, listen: false)
          .changeSelectedClass(_load[0]);
      notifyListeners();
    }
    schoolLevelInit = false;
  }
}
