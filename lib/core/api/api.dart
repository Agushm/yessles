import 'package:yessles/config_reader.dart';

class API {
  static String baseURL = ConfigReader.getBaseUrl() + '/api/v1';

  // *User* //
  static String loginGmail = baseURL + '/user/login-gmail';
  static String loginPhone = baseURL + '/user/login-phone';
  static String register = baseURL + '/user/register';
  static String userProfile = baseURL + '/user/detail';

  // *Article* //
  static String getArticle = baseURL + '/artikel/all';
  static String getArticleById = baseURL + '/artikel/detail/';

  // *Mapel* //
  static String getMapel = baseURL + '/kategori/all';
  static String getMapelById = baseURL + '/kategori/detail/';
}
