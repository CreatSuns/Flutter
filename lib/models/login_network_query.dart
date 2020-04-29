import 'dart:convert';

import 'package:cache/sharepreferences_until.dart';
import 'package:flutter_material/commons/Network.dart';
import 'package:flutter_material/commons/Urls.dart';
import 'package:flutter_material/generated/json/login_model_entity_helper.dart';
import 'package:sqflite/sqflite.dart';

import 'login_model_entity.dart';

class LoginNetWorkQuery{

  static Future login(Map<String, dynamic> params) async {
    var data = await HttpQuerery.post(loginUrl, data: params);
    try {
      LoginModelEntity loginModel = loginModelEntityFromJson(LoginModelEntity(), json.decode(data));
      ShardPreferences.localSave('access_token', loginModel.data.accessToken);
      return loginModel;
    } catch (error) {
      print('error-----$error----');
      return null;
    }
  }

  static Future chooseProductLine(Map<String, dynamic> params) async {
    var data = await HttpQuerery.post(productLineUrl, data: params);
//    try {
//      LoginModelEntity loginModel = loginModelEntityFromJson(LoginModelEntity(), json.decode(data));
//      ShardPreferences.localSave('access_token', loginModel.data.accessToken);
//      return loginModel;
//    } catch (error) {
//      print('error-----$error----');
//      return null;
//    }
  }

  static Future saveModel() async {
    var databasesPath = await getDatabasesPath();

  }
}