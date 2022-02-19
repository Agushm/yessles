part of 'providers.dart';

class ScheduleProvider with ChangeNotifier {
  // List<Schedule> _userSchedules = [];
  // List<Schedule> get userSchedules => _userSchedules;
  // bool userSchedulesInit = true;

  List<Schedule> _userSchedules = [
    Schedule(
        day: 'Sabtu',
        guru: Teacher.fromJson(mockTeacher),
        duration: 2,
        guruId: 1,
        id: 1,
        hariId: 1,
        jamMulai: '15.30',
        jamSelesai: '18.00',
        mapel: Mapel.fromJson(jsonMapel),
        status: 'sucess',
        tanggal: DateTime.now().toString()),
  ];
  List<Schedule> get userSchedules => _userSchedules;

  bool userSchedulesInit = false;

  int _pageNumberUserSchedules = 1;
  int _maxNumberUserSchedules = 5;
  bool _hasMoreUserSchedules = true;
  bool _loadingUserSchedules = false;

  Future<void> reload(BuildContext context) async {
    _userSchedules = <Schedule>[];
    _pageNumberUserSchedules = 1;
    _hasMoreUserSchedules = true;
    await getUserSchedulesMore(context);
  }

  Future<void> getUserSchedulesMore(BuildContext context) async {
    if (_hasMoreUserSchedules && !_loadingUserSchedules) {
      _loadingUserSchedules = true;
      await getUserSchedules(context, page: _pageNumberUserSchedules);
      _loadingUserSchedules = false;
    } else {
      return;
    }
  }

  Future<void> getUserSchedules(BuildContext context,
      {bool isRefresh = true, int? page}) async {
    int pageNumber = page!;
    print('get user schedules: page $_pageNumberUserSchedules');
    var res = await ScheduleServices.instance.getScheduleUser(context, params: {
      'page': _pageNumberUserSchedules,
      'max': _maxNumberUserSchedules,
    });

    if (res['status'] == 'success') {
      var d = res['data']['docs'] as List;
      d.forEach((e) {
        _userSchedules.add(Schedule.fromJson(e));
      });
      if (res['data']['pages'] == page) {
        _hasMoreUserSchedules = false;
      }
    }
    pageNumber++;

    userSchedulesInit = false;
    _pageNumberUserSchedules = pageNumber;

    notifyListeners();
  }
}
