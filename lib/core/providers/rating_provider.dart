part of 'providers.dart';

class RatingProvider with ChangeNotifier {
  List<Review> _rating = [];
  List<Review> get reviews => _rating;
  bool reviewsInit = true;

  Future getRating(BuildContext context) async {
    var res = await RatingServices.instance
        .getAll(context, params: {'page': 1, 'max': 20});
    if (res != null && res['status'] == 'success') {
      var d = res['data']['docs'] as List;
      d.forEach((e) {
        _rating.add(Review.fromJson(e));
      });
      notifyListeners();
    }
    reviewsInit = false;
  }

  Future addRating(BuildContext context, Map<String, dynamic> data) async {
    var res = await RatingServices.instance.addRating(context, data: data);
    if (res != null && res['status'] == 'success') {
      var d = res['data']['docs'] as List;
      d.forEach((e) {
        _rating.add(Review.fromJson(e));
      });
      notifyListeners();
    }
    reviewsInit = false;
  }
}
