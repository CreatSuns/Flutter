import 'package:flutter_material/models/home/home_comment_model_entity.dart';

homeCommentModelEntityFromJson(HomeCommentModelEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new HomeCommentModelData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> homeCommentModelEntityToJson(HomeCommentModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

homeCommentModelDataFromJson(HomeCommentModelData data, Map<String, dynamic> json) {
	if (json['page'] != null) {
		data.page = new HomeCommentModelDataPage().fromJson(json['page']);
	}
	if (json['list'] != null) {
		data.xList = new List<HomeCommantModelDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HomeCommantModelDataList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeCommentModelDataToJson(HomeCommentModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.page != null) {
		data['page'] = entity.page.toJson();
	}
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

homeCommentModelDataPageFromJson(HomeCommentModelDataPage data, Map<String, dynamic> json) {
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

Map<String, dynamic> homeCommentModelDataPageToJson(HomeCommentModelDataPage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['current'] = entity.current;
	data['total'] = entity.total;
	data['count'] = entity.count;
	return data;
}

homeCommantModelDataListFromJson(HomeCommantModelDataList data, Map<String, dynamic> json) {
	if (json['comment_id'] != null) {
		data.commentId = json['comment_id']?.toInt();
	}
	if (json['admin_id'] != null) {
		data.adminId = json['admin_id']?.toInt();
	}
	if (json['agent_id'] != null) {
		data.agentId = json['agent_id']?.toInt();
	}
	if (json['circle_id'] != null) {
		data.circleId = json['circle_id']?.toInt();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['circle_role_id'] != null) {
		data.circleRoleId = json['circle_role_id']?.toInt();
	}
	if (json['create_time'] != null) {
		data.createTime = json['create_time']?.toString();
	}
	if (json['update_time'] != null) {
		data.updateTime = json['update_time']?.toString();
	}
	if (json['agent_name'] != null) {
		data.agentName = json['agent_name']?.toString();
	}
	if (json['agent_avatar'] != null) {
		data.agentAvatar = json['agent_avatar']?.toString();
	}
	if (json['agent_level_name'] != null) {
		data.agentLevelName = json['agent_level_name']?.toString();
	}
	return data;
}

Map<String, dynamic> homeCommantModelDataListToJson(HomeCommantModelDataList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['comment_id'] = entity.commentId;
	data['admin_id'] = entity.adminId;
	data['agent_id'] = entity.agentId;
	data['circle_id'] = entity.circleId;
	data['content'] = entity.content;
	data['circle_role_id'] = entity.circleRoleId;
	data['create_time'] = entity.createTime;
	data['update_time'] = entity.updateTime;
	data['agent_name'] = entity.agentName;
	data['agent_avatar'] = entity.agentAvatar;
	data['agent_level_name'] = entity.agentLevelName;
	return data;
}