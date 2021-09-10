import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:html/parser.dart';

final formatter = NumberFormat("#,##0", "in_ID");

final fRupiah = NumberFormat("Rp" + "#,##0", "in_ID");

final fDate = DateFormat('dd MMMM yyyy', 'id_ID');

String formatInt(int nominal) {
  return formatter.format(nominal);
}

String formatRupiah(int nominal) {
  return fRupiah.format(nominal);
}

String formatDateTransaction(DateTime tgl, {bool withTime = false}) {
  final fDate = DateFormat('yyyy-MM-dd');
  final fDateWithTime = DateFormat('yyyy-MM-dd HH:mm');
  if (withTime) {
    return fDateWithTime.format(tgl);
  } else {
    return fDate.format(tgl);
  }
}

String twoDigits(int n) => n.toString().padLeft(2, "0");
String formatTime(DateTime date) {
  String hour = twoDigits(date.hour);
  String minute = twoDigits(date.minute);
  String second = twoDigits(date.second);
  return '$hour:$minute:$second';
}

String formatTimeFromDuration(Duration duration) {
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

String formatJam(DateTime date) {
  final fTime = DateFormat('HH:mm');
  String time = fTime.format(date);
  return time;
}

String tanggal(DateTime date,
    {bool shortMonth = false, bool withTime = false, bool withWIB = false}) {
  final fTime = DateFormat('HH:mm');
  if (withTime) {
    String wib = withWIB ? 'WIB' : '';
    String time = fTime.format(date);
    return "${date.day} ${_convertToLocalMonth(date.month, shortMonth)} ${date.year} $time $wib";
  }
  return "${date.day} ${_convertToLocalMonth(date.month, shortMonth)} ${date.year}";
}

String tanggalBerita(DateTime date,
    {bool shortMonth = false, bool withTime = false}) {
  final fTime = DateFormat('HH:mm');
  final newTime = fTime.format(date);
  if (withTime) {
    return "${_day[date.weekday - 1]}, ${date.day} ${_convertToLocalMonth(date.month, shortMonth)} ${date.year} | $newTime WIB";
  }
  return "${_day[date.weekday - 1]}, ${date.day} ${_convertToLocalMonth(date.month, shortMonth)} ${date.year} ";
}

String tanggalInvoice(DateTime date, {bool shortMonth = false}) {
  return "${date.day} ${_convertToLocalMonth(date.month, shortMonth)} ${date.year}, ${date.hour}:${date.minute} WIB";
}

List _day = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];

List _longMonth = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember'
];
List _shortMonth = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'Mei',
  'Jun',
  'Jul',
  'Agu',
  'Sep',
  'Okt',
  'Nov',
  'Des'
];

String _convertToLocalMonth(int month, bool shortMonth) {
  if (shortMonth) return _shortMonth[month - 1];
  return _longMonth[month - 1];
}

class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final f = NumberFormat("#,###", "in_ID");
      final number =
          int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(number);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}

String printDurationMinuteSeconds(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}

String formatStatus(String status) {
  if (status == "on-progress") {
    return "Proses";
  }
  if (status == "on-process") {
    return "Proses";
  }
  if (status == "failed") {
    return "Dibatalkan";
  }
  if (status == "success") {
    return "Sukses";
  } else {
    return "";
  }
}

String formatStatus2(String status) {
  if (status == "on-progress") {
    return "Diproses";
  }
  if (status == "failed") {
    return "Dibatalkan";
  }
  if (status == "success") {
    return "Sukses";
  } else {
    return "";
  }
}

String formatStatusTransaksi(String status) {
  if (status == "on-progress") {
    return "Transaksi Sedang Diproses";
  }
  if (status == "failed") {
    return "Transaksi Dibatalkan";
  }
  if (status == "success") {
    return "Transaksi Sukses";
  } else {
    return "";
  }
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}
