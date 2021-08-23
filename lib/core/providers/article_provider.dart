part of 'providers.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> _slideBanner = [];
  List<Article> get slideBanner => _slideBanner;
  bool slideInit = true;

  Future getBanner(BuildContext context) async {
    var res = await ArticleServices.instance
        .getAll(context, params: {'page': 1, 'max': 5, 'status': 'slide'});
    if (res != null && res['status'] == 'success') {
      var d = res['data']['docs'] as List;
      d.forEach((e) {
        _slideBanner.add(Article.fromJson(e));
      });
      notifyListeners();
    }
    slideInit = false;
  }

  List<Article> _listNews = [];
  List<Article> get listNews => _listNews;
  bool newsInit = true;

  Future getNews(BuildContext context) async {
    var res = await ArticleServices.instance
        .getAll(context, params: {'page': 1, 'max': 5, 'status': 'berita'});
    if (res != null && res['status'] == 'success') {
      var d = res['data']['docs'] as List;
      d.forEach(
        (e) {
          _listNews.add(Article.fromJson(e));
        },
      );
      notifyListeners();
    }
    newsInit = false;
  }
}
