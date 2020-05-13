import 'dart:convert';
import 'dart:convert' as convert;

import 'package:flutter_material/commons/Network.dart';
import 'package:flutter_material/commons/Urls.dart';
import 'package:flutter_material/generated/json/home_cover_image_entity_helper.dart';
import 'package:flutter_material/generated/json/home_model_entity_helper.dart';
import 'package:flutter_material/models/home_cover_image_entity.dart';
import 'package:flutter_material/models/home_model_entity.dart';
import 'package:flutter_material/models/login_model_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeNetworkQuery {
  static Future homeCoverImageQuery() async {
    var data = await HttpQuerery.get(homeCoverImageUrl);
    try {
      HomeCoverImageEntity model = homeCoverImageEntityFromJson(
          HomeCoverImageEntity(), json.decode(data));
      return model;
    } catch (error) {
      print('error-----$error----');
      return null;
    }
  }

  static Future homeListDataQuery(Map<String, dynamic> map) async {
    var data = await HttpQuerery.get(homeListDataUrl, data: map);
    try {
      HomeModelEntity homeModelEntity =
          homeModelEntityFromJson(HomeModelEntity(), json.decode(data));
      return homeModelEntity;
    } catch (error) {
      print('error-----$error----');
      return null;
    }
  }

  static Future homeCollect(Map<String, dynamic> map) async {
    var data = await HttpQuerery.post(homeCollectUrl, data: map);
  }

  static Future homeLike(Map<String, dynamic> map) async {
    var data = await HttpQuerery.post(homeLikeUrl, data: map);
  }

  static Future<LoginModelDataAgent> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonStr = prefs.getString("agents");
    List<LoginModelDataAgent> agents = new List();
    List agents_json = convert.jsonDecode(jsonStr);
    for (var i = 0; i < agents_json.length; i++) {
      agents.add(new LoginModelDataAgent().fromJson(agents_json[i]));
    }
    LoginModelDataAgent agent = LoginModelDataAgent();
    for (var i = 0; i < agents.length; i++) {
      if (agents[i].adminId == prefs.getInt("adminId")) {
        agent = agents[i];
        break;
      }
    }
    return agent;
  }

  static Future<List<LoginModelDataAgent>> getAgentsInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonStr = prefs.getString("agents");
    List<LoginModelDataAgent> agents = new List();
    List agents_json = convert.jsonDecode(jsonStr);
    for (var i = 0; i < agents_json.length; i++) {
      agents.add(new LoginModelDataAgent().fromJson(agents_json[i]));
    }
    return agents;
  }

  static Future<int> getSelectIndex(List<LoginModelDataAgent> models) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int selectIndex = 0;
    for (var i = 0; i < models.length; i++) {
      if (models[i].adminId == prefs.getInt("adminId")) {
        selectIndex = i;
        break;
      }
    }
    return selectIndex;
  }
}
