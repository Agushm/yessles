part of 'providers.dart';

class RatingProvider with ChangeNotifier {
  List<Rating> _rating = [];
  List<Rating> get ratings => _rating;
  bool reviewsInit = true;

  Future getRating(BuildContext context,
      {String? type, String? userId, bool? isRefresh}) async {
    if (isRefresh!) {
      _rating = [];
      reviewsInit = true;
    }
    var res = await RatingServices.instance.getAll(context,
        type: type, userId: userId, params: {'page': 1, 'max': 5});
    if (res != null && res['status'] == 'success') {
      var d = res['data']['docs'] as List;
      d.forEach((e) {
        _rating.add(Rating.fromJson(e));
      });
    }
    reviewsInit = false;
    notifyListeners();
  }

  Future addRating(BuildContext context, Map<String, dynamic> data) async {
    DialogUtils.instance.showLoading(context, 'Mohon menunggu...');

    var res = await RatingServices.instance.addRating(context, data: data);
    Get.back();
    if (res != null && res['status'] == 'success') {
      _rating.add(Rating.fromJson(res['data']));
      DialogUtils.instance.showInfo(context,
          message: '${res['message']}', btnText: 'Tutup', onPressed: () {
        Get.back();
      });
      Provider.of<TeacherProvider>(context, listen: false).updateTotalRating(
          data['guru_id'],
          double.parse(res['data']['total_rating'].toString()));
    } else {
      DialogUtils.instance.showInfo(context,
          message: '${res['message']}', btnText: 'Tutup', onPressed: () {
        Get.back();
      });
    }
    notifyListeners();
  }
}
