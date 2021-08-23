part of '../services.dart';

class ArticleServices extends BaseServices {
  static ArticleServices instance = ArticleServices();
  Future<dynamic> getAll(BuildContext context,
      {Map<String, dynamic>? params}) async {
    var res = await request(API.getArticle, RequestType.GET, context,
        useToken: true, params: params);
    return res;
  }

  Future<dynamic> getById(BuildContext context, int id) async {
    var res = await request(
      API.getArticleById + '$id',
      RequestType.GET,
      context,
      useToken: true,
    );
    return res;
  }
}
