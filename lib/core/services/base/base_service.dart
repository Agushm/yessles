part of '../services.dart';

enum RequestType { GET, POST, DELETE, PUT }

class BaseServices {
  Dio _dio = new Dio(BaseOptions(
    connectTimeout: 20000,
    receiveTimeout: 15000,
  ));
  Options? _headersOption;

  Future _getToken() async {
    var _token = await ServicePreferances.instance.getToken();

    _headersOption = ConfigServices.getHeaders(token: _token!);
  }

  Future<dynamic> request(String url, RequestType type, BuildContext context,
      {Map<String, dynamic>? params, dynamic data, bool? useToken}) async {
    var response;

    //If this route use token then fetch token
    if (useToken != null && useToken) {
      await _getToken();
    } else {
      _headersOption = ConfigServices.getHeaders();
    }

    try {
      switch (type) {
        case RequestType.GET:
          response = await _dio.get(url,
              options: _headersOption, queryParameters: params);
          break;
        case RequestType.POST:
          response = await _dio.post(url,
              data: data != null ? data : null,
              options: _headersOption,
              queryParameters: params);
          break;

        case RequestType.PUT:
          response = await _dio.put(url,
              data: data != null ? data : null,
              options: _headersOption,
              queryParameters: params);
          break;
        case RequestType.DELETE:
          response = await _dio.delete(url,
              data: data != null ? data : null,
              options: _headersOption,
              queryParameters: params);
          break;
      }
    } on DioError catch (e) {
      response = e.response;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Terjadi Kesalahan'),
        duration: const Duration(seconds: 3),
      ));
    }

    //* Handling error and status code
    response = json.decode(response.toString());
    // if (response == null) {
    //   errorToast("Terjadi kesalahan");
    //   return null;
    // }

    if (response != null &&
        response["status"].toString() == "error" &&
        response["message"] == "error token") {
      DialogUtils.instance.showInfo(context,
          title: "Gagal Ambil Data",
          message: "Silahkan melakukan login ulang",
          btnText: "Halaman Login", onPressed: () async {
        // Provider.of<UserProvider>(context, listen: false).logout(context);
        Get.offAll(LandingPage());
      });
      return response;
    }

    return response;
  }
}

class ConfigServices {
  static Options getHeaders({String token = ""}) {
    var _headers = Map<String, dynamic>();
    _headers['Accept'] = "application/json";

    if (token != '') {
      _headers["Authorization"] = "$token";
    }

    return Options(headers: _headers);
  }
}
