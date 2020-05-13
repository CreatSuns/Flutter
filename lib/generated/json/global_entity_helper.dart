import 'package:flutter_material/models/global/global_entity.dart';

globalEntityFromJson(GlobalEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	return data;
}

Map<String, dynamic> globalEntityToJson(GlobalEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	return data;
}