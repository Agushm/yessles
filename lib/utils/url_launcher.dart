import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

void launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

String urlWA(String phone, String message) {
  if (Platform.isAndroid) {
    // add the [https]
    return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
  } else {
    // add the [https]
    return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
  }
}
