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
      List<Paket> _load = [];
      d.forEach((e) {
        _load.add(Paket.fromJson(e));
      });
      listPaket = _load;
      selectedPaket = _load[0];
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
        'sesi': null,
      },
      {
        'teacher': null,
        'day': teachingDays[0],
        'sesi': null,
      },
      {
        'teacher': null,
        'day': teachingDays[0],
        'sesi': null,
      },
    ];

    notifyListeners();
  }

  void resetSelectedMapel() {
    _selectedMapel = [];
  }

  void addSelectedMapel(Mapel data, int? maxSelected) {
    if (_selectedMapel.indexOf(data) != -1) {
      print('Memilih Mapel $data');
      return;
    } else if (_selectedMapel.length == maxSelected) {
      print('Sudah memilih $maxSelected mapel');
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
      'sesi': null,
    },
    {
      'teacher': null,
      'day': days[0],
      'sesi': null,
    },
    {
      'teacher': null,
      'day': days[0],
      'sesi': null,
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
    _selectedTeacher[index]['day'] = days[0];
    notifyListeners();
  }

  Future<List<Schedule>?> getTeacherSchedule(BuildContext context,
      {int? index, String? teacherId, String? dayId}) async {
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
      if (index != null) {
        addSelectedTeachingSession(index, _load[0]);
        notifyListeners();
      }
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
        index: index, teacherId: teacher.id.toString(), dayId: "${iDays + 1}");
    Teacher t = _selectedTeacher[index]['teacher'];
    t.jadwal = teacherSchedule;
    _selectedTeacher[index]['day'] = data;

    notifyListeners();
  }

  void addSelectedTeachingSession(int index, Schedule data) {
    _selectedTeacher[index]['sesi'] = data;
    notifyListeners();
  }

  bool isGetTeacherInit = true;
  Future getTeachers(BuildContext context) async {
    _selectedMapel.forEach((m) async {
      var index = _selectedMapel.indexOf(m);
      var teacher = await Provider.of<TeacherProvider>(context, listen: false)
          .getTeacher(context,
              idMapel: m.id.toString(),
              idJenjang: selectedClass!.id!.toString(),
              idKelas: selectedNumberClass!.id!.toString());
      _selectedMapel[index].teachers = teacher;
    });
    isGetTeacherInit = false;
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

  //Create Transaction
  void createTransaction(BuildContext context, {String? payMethod}) async {
    List<int> _jadwal = [];
    selectedTeacher.forEach((e) {
      Schedule? sesi = e['sesi'];
      if (sesi != null) {
        _jadwal.add(sesi.id!);
      }
    });
    DialogUtils.instance.showLoading(context, 'Membuat transaksi...');
    var res =
        await TransactionServices.instance.createTransaction(context, data: {
      "paket_id": selectedPaket!.id!,
      "pembayaran": payMethod,
      "voucher": voucherTextController.text.isEmpty
          ? null
          : voucherTextController.text,
      "jadwal": _jadwal
    });
    Get.back();
    if (res == null) {
      return;
    } else if (res['status'] == 'success') {
      Get.back();
      Get.back();
      Get.back();
      Get.back();
      Get.back();
      Get.to(DetailTransactionPage(
          payingMethod: payMethod, data: Transaction.fromJson(res['data'])));
    } else {
      DialogUtils.instance.showInfo(context,
          title: 'Transaksi Gagal',
          message: res['message'].runtimeType == String
              ? res['message']
              : 'Terjadi Kesalahan',
          btnText: 'Tutup', onPressed: () {
        Get.back();
      });
    }
  }

  TextEditingController voucherTextController = TextEditingController();
  Voucher? selectedVoucher;

  Future<Map<String, dynamic>?> cekVoucher(BuildContext context,
      {String? payMethod}) async {
    DialogUtils.instance.showLoading(context, 'Cek Voucher');
    var res = await TransactionServices.instance
        .cekVoucher(context, data: {"voucher": voucherTextController.text});
    Get.back();
    if (res == null) {
      return res;
    } else if (res['status'] == 'success') {
      selectedVoucher = Voucher.fromJson(res['data']);
      return res;
    } else {
      return res;
    }
  }
}
