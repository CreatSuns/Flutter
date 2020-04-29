import 'dart:convert';

import 'package:cache/sharepreferences_until.dart';
import 'package:flutter_material/commons/Network.dart';
import 'package:flutter_material/commons/Urls.dart';
import 'package:flutter_material/generated/json/login_model_entity_helper.dart';

import 'login_model_entity.dart';

class LoginNetWorkQuery{

  static Future login(Map<String, dynamic> params) {

    try {
      HttpQuerery.post(loginUrl, data: params, success: (data) {
        print('data=======$data=======');
        LoginModelEntity loginModel = loginModelEntityFromJson(LoginModelEntity(), json.decode(data));
        ShardPreferences.localSave('access_token', loginModel.data.accessToken);
        return loginModel;
      }, error: (string) {
        print('errorString-----$string----');
        return null;
      });
    } catch (error) {
      print('error-----$error----');
      return null;
    }
  }
}