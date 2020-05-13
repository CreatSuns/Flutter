import 'package:flutter_material/models/mine/notice_model_entity.dart';

noticeModelEntityFromJson(NoticeModelEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new NoticeModelEntityData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> noticeModelEntityToJson(NoticeModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

noticeModelEntityDataFromJson(NoticeModelEntityData data, Map<String, dynamic> json) {
	if (json['page'] != null) {
		data.page = new NoticeModelEntityDataPage().fromJson(json['page']);
	}
	if (json['list'] != null) {
		data.xList = new List<NoticeModelEntityDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new NoticeModelEntityDataList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> noticeModelEntityDataToJson(NoticeModelEntityData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.page != null) {
		data['page'] = entity.page.toJson();
	}
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

noticeModelEntityDataPageFromJson(NoticeModelEntityDataPage data, Map<String, dynamic> json) {
	if (json['current'] != null) {
		data.current = json['current']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	return data;
}

Map<String, dynamic> noticeModelEntityDataPageToJson(NoticeModelEntityDataPage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['current'] = entity.current;
	data['total'] = entity.total;
	data['count'] = entity.count;
	return data;
}

noticeModelEntityDataListFromJson(NoticeModelEntityDataList data, Map<String, dynamic> json) {
	if (json['notice_id'] != null) {
		data.noticeId = json['notice_id']?.toInt();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['create_time'] != null) {
		data.createTime = json['create_time']?.toString();
	}
	if (json['end_time'] != null) {
		data.endTime = json['end_time']?.toString();
	}
	if (json['is_read'] != null) {
		data.isRead = json['is_read']?.toInt();
	}
	return data;
}

Map<String, dynamic> noticeModelEntityDataListToJson(NoticeModelEntityDataList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['notice_id'] = entity.noticeId;
	data['content'] = entity.content;
	data['create_time'] = entity.createTime;
	data['end_time'] = entity.endTime;
	data['is_read'] = entity.isRead;
	return data;
}