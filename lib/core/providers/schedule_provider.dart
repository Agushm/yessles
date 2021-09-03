part of 'providers.dart';

class ScheduleProvider with ChangeNotifier {
  List<Schedule> _userSchedules = [];
  List<Schedule> get userSchedules => _userSchedules;
  bool userSchedulesInit = true;

  Future getScheduleUser(BuildContext context) async {
    var res = await ScheduleServices.instance.getScheduleUser(context,
        params: {'page': 1, 'max': 5, 'status': 'slide'});
    if (res != null && res['status'] == 'success') {
      var d = res['data']['docs'] as List;
      d.forEach((e) {
        _userSchedules.add(Schedule.fromJson(e));
      });
      notifyListeners();
    }
    userSchedulesInit = false;
  }
}
