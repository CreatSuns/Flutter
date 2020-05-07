import 'dart:convert';

import 'package:cache/sharepreferences_until.dart';
import 'package:flutter_material/commons/Network.dart';
import 'package:flutter_material/commons/Urls.dart';
import 'package:flutter_material/generated/json/login_model_entity_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlmanager/model_turn.dart';
import 'package:sqlmanager/sqlmanager.dart';


import 'login_model_entity.dart';

const String loginTable = 'loginTable';

class LoginNetWorkQuery{

  Database database;

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

  static Future saveModel(List<LoginModelDataAgent> agent) async {
    SqliteFile file = SqliteFile();
    await file.open();
    bool isHave = await file.isTableExits(loginTable);
    if (isHave == false) {
      await file.createTable(loginTable, ModelTurn.paramsToList(loginModelDataAgentToJson(agent.first)), ModelTurn.paramsTypeToList(loginModelDataAgentToJson(agent.first)));
    }
    agent.forEach((element) async {
      int aaa = await file.insert(loginTable, loginModelDataAgentToJson(element));
      print('aaa==$aaa');
    });

  }




}