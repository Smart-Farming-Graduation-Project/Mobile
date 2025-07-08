import 'dart:developer';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/database/cache/cache_helper.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class DecodedToken {
  void saveDecodedToken(String token) {
    log(token);
    final tokenData = JwtDecoder.decode(token);
    log(tokenData.toString());
    getIt<CacheHelper>().saveData(key: ApiKeys.userId, value: tokenData["sub"]);
    getIt<CacheHelper>()
        .saveData(key: ApiKeys.email, value: tokenData["email"]);
    getIt<CacheHelper>()
        .saveData(key: ApiKeys.username, value: tokenData["given_name"]);
    final roleData = tokenData["Role"];
    List<dynamic> rolesList = [];
    if (roleData is List<dynamic>) {
      rolesList = roleData;
    } else {
      rolesList.add(roleData);
    }
    if (rolesList.contains("Farmer")) {
      getIt<CacheHelper>().saveData(key: ApiKeys.role, value: "Farmer");
    }
    else if (rolesList.contains("Buyer") || rolesList.contains("User")) {
      getIt<CacheHelper>().saveData(key: ApiKeys.role, value: "Buyer");
    }
  }
}
