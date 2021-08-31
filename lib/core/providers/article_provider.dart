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

  // List<Article> _listNews = [];
  // List<Article> get listNews => _listNews;
  // bool newsInit = true;

  // Future getNews(BuildContext context) async {
  //   var res = await ArticleServices.instance
  //       .getAll(context, params: {'page': 1, 'max': 5, 'status': 'berita'});
  //   if (res != null && res['status'] == 'success') {
  //     var d = res['data']['docs'] as List;
  //     d.forEach(
  //       (e) {
  //         _listNews.add(Article.fromJson(e));
  //       },
  //     );
  //     notifyListeners();
  //   }
  //   newsInit = false;
  // }

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  bool isArticleInit = true;

  int _pageNumberArticle = 1;
  int _maxNumberArticle = 10;
  bool _hasMoreArticle = true;
  bool _loadingArticle = false;

  Future<void> reload(BuildContext context) async {
    _articles = <Article>[];
    _pageNumberArticle = 1;
    _hasMoreArticle = true;
    await getMore(context);
  }

  Future<void> getMore(BuildContext context) async {
    if (_hasMoreArticle && !_loadingArticle) {
      _loadingArticle = true;
      await getBerita(context, page: _pageNumberArticle);
      _loadingArticle = false;
    } else {
      return;
    }
  }

  Future<void> getBerita(BuildContext context,
      {bool isRefresh = true, int? page}) async {
    int pageNumber = page!;

    var res = await ArticleServices.instance.getAll(context, params: {
      'page': _pageNumberArticle,
      'max': _maxNumberArticle,
      'status': 'berita'
    });

    if (res['status'] == 'success') {
      var d = res['data']['docs'] as List;
      d.forEach((e) {
        _articles.add(Article.fromJson(e));
      });
      if (res['data']['pages'] == page) {
        _hasMoreArticle = false;
      }
    }
    pageNumber++;

    isArticleInit = false;
    _pageNumberArticle = pageNumber;

    notifyListeners();
  }
}
