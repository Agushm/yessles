import 'package:yessles/config_reader.dart';

class API {
  static String baseURL = ConfigReader.getBaseUrl() + '/api/v1';

  // *User* //
  static String loginGmail = baseURL + '/user/login-gmail';
  static String loginPhone = baseURL + '/user/login-phone';
  static String register = baseURL + '/user/register';
  static String userProfile = baseURL + '/user/detail';
  static String report = baseURL + '/user/report';

  // *Topup* //
  static String createTopup = baseURL + '/topup/create';
  static String topupDetail = baseURL + '/topup/detail';
  static String topupMethod = baseURL + '/topup/method';
  static String historyTopup = baseURL + '/topup/history';
  static String topupCoin = baseURL + '/topup/coin';

  // *Gift* //
  static String listGift = baseURL + '/item/list';

  // *Term* //
  static String getTerm = baseURL + '/helpdesk/all?type=tnc';
  static String getHelp = baseURL + '/helpdesk/all?type=help';
}
