import 'package:flutter_material/models/home/home_cover_image_entity.dart';

homeCoverImageEntityFromJson(HomeCoverImageEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new HomeCoverImageData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> homeCoverImageEntityToJson(HomeCoverImageEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

homeCoverImageDataFromJson(HomeCoverImageData data, Map<String, dynamic> json) {
	if (json['cover_image'] != null) {
		data.coverImage = json['cover_image']?.toString();
	}
	return data;
}

Map<String, dynamic> homeCoverImageDataToJson(HomeCoverImageData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['cover_image'] = entity.coverImage;
	return data;
}