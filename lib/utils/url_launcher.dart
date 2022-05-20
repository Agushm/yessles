import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

String urlWA(String phone, String message) {
  if (Platform.isAndroid) {
    // add the [https]
    return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
  } else {
    // add the [https]
    return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
  }
}
