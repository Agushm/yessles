import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yessles/core/models/models.dart';

part 'base/base_service.dart';

part 'firebase/fcm_services.dart';
part 'google_signin_service.dart';
part 'service_preference/service_preference.dart';
part 'user/user_services.dart';
