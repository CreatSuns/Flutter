
import 'dart:convert';

import 'package:flutter_material/commons/Network.dart';
import 'package:flutter_material/commons/Urls.dart';
import 'package:flutter_material/generated/json/home_cover_image_entity_helper.dart';
import 'package:flutter_material/models/home_cover_image_entity.dart';
import 'package:flutter_material/models/home_model_entity.dart';
import 'package:flutter_material/generated/json/home_model_entity_helper.dart';

class HomeNetworkQuery {

  static Future homeCoverImageQuery() async {
    var data = await HttpQuerery.get(homeCoverImageUrl);
    try {
      HomeCoverImageEntity model = homeCoverImageEntityFromJson(HomeCoverImageEntity(), json.decode(data));
      return model;
    } catch (error) {
      print('error-----$error----');
      return null;
    }
  }

  static Future homeListDataQuery(Map<String, dynamic> map) async {
    var data = await HttpQuerery.get(homeListDataUrl, data: map);
    try {
      HomeModelEntity homeModelEntity = homeModelEntityFromJson(HomeModelEntity(), json.decode(data));
      return homeModelEntity;
    } catch (error) {
      print('error-----$error----');
      return null;
    }
  }
}