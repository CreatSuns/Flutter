import 'dart:convert';

import 'package:flutter_material/commons/Network.dart';
import 'package:flutter_material/commons/Urls.dart';
import 'package:flutter_material/generated/json/notice_model_entity_entity_helper.dart';

import 'notice_model_entity.dart';

class NoticeNetworkQuery{

  static Future noticeListQuery(Map<String, dynamic> map) async {
    var data = await HttpQuerery.get(noticeUrl, data: map);
    try {
      NoticeModelEntity noticeModelEntityEntity = noticeModelEntityEntityFromJson(NoticeModelEntity(), json.decode(data));
      return noticeModelEntityEntity;
    } catch (error) {
      print('error-----$error----');
      return null;
    }
  }
}