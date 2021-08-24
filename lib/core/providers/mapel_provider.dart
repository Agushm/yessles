part of 'providers.dart';

class MapelProvider with ChangeNotifier {
  List<Mapel> _mapel = [];
  List<Mapel> get mapel => _mapel;
  bool mapelInit = true;

  Future getMapel(BuildContext context) async {
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
      d.forEach((e) {
        _schoolLevel.add(SchoolLevel.fromJson(e));
      });
      notifyListeners();
    }
    schoolLevelInit = false;
  }
}
