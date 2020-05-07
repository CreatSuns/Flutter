import 'package:flutter_material/models/home_model_entity.dart';

homeModelEntityFromJson(HomeModelEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new HomeModelData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> homeModelEntityToJson(HomeModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

homeModelDataFromJson(HomeModelData data, Map<String, dynamic> json) {
	if (json['page'] != null) {
		data.page = new HomeModelDataPage().fromJson(json['page']);
	}
	if (json['list'] != null) {
		data.xList = new List<HomeModelDataList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HomeModelDataList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeModelDataToJson(HomeModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.page != null) {
		data['page'] = entity.page.toJson();
	}
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

homeModelDataPageFromJson(HomeModelDataPage data, Map<String, dynamic> json) {
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

Map<String, dynamic> homeModelDataPageToJson(HomeModelDataPage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['current'] = entity.current;
	data['total'] = entity.total;
	data['count'] = entity.count;
	return data;
}

homeModelDataListFromJson(HomeModelDataList data, Map<String, dynamic> json) {
	if (json['circle_id'] != null) {
		data.circleId = json['circle_id']?.toInt();
	}
	if (json['admin_id'] != null) {
		data.adminId = json['admin_id']?.toInt();
	}
	if (json['agent_id'] != null) {
		data.agentId = json['agent_id']?.toInt();
	}
	if (json['circle_role_id'] != null) {
		data.circleRoleId = json['circle_role_id']?.toInt();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['circle_status'] != null) {
		data.circleStatus = json['circle_status']?.toInt();
	}
	if (json['base_point_number'] != null) {
		data.basePointNumber = json['base_point_number']?.toInt();
	}
	if (json['real_point_number'] != null) {
		data.realPointNumber = json['real_point_number']?.toInt();
	}
	if (json['create_time'] != null) {
		data.createTime = json['create_time']?.toString();
	}
	if (json['update_time'] != null) {
		data.updateTime = json['update_time']?.toString();
	}
	if (json['operate_time'] != null) {
		data.operateTime = json['operate_time']?.toString();
	}
	if (json['circle_pass_id'] != null) {
		data.circlePassId = json['circle_pass_id']?.toInt();
	}
	if (json['role'] != null) {
		data.role = json['role']?.toInt();
	}
	if (json['agent_name'] != null) {
		data.agentName = json['agent_name']?.toString();
	}
	if (json['agent_avatar'] != null) {
		data.agentAvatar = json['agent_avatar']?.toString();
	}
	if (json['agent_level'] != null) {
		data.agentLevel = json['agent_level']?.toInt();
	}
	if (json['is_collect'] != null) {
		data.isCollect = json['is_collect']?.toInt();
	}
	if (json['is_point'] != null) {
		data.isPoint = json['is_point']?.toInt();
	}
	if (json['image'] != null) {
		data.image = new List<dynamic>();
		data.image.addAll(json['image']);
	}
	if (json['comment'] != null) {
		data.comment = new List<HomeModelDataListCommant>();
		(json['comment'] as List).forEach((v) {
			data.comment.add(new HomeModelDataListCommant().fromJson(v));
		});
	}
	if (json['point_num'] != null) {
		data.pointNum = json['point_num']?.toInt();
	}
	if (json['agent_level_name'] != null) {
		data.agentLevelName = json['agent_level_name']?.toString();
	}
	return data;
}

Map<String, dynamic> homeModelDataListToJson(HomeModelDataList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['circle_id'] = entity.circleId;
	data['admin_id'] = entity.adminId;
	data['agent_id'] = entity.agentId;
	data['circle_role_id'] = entity.circleRoleId;
	data['content'] = entity.content;
	data['circle_status'] = entity.circleStatus;
	data['base_point_number'] = entity.basePointNumber;
	data['real_point_number'] = entity.realPointNumber;
	data['create_time'] = entity.createTime;
	data['update_time'] = entity.updateTime;
	data['operate_time'] = entity.operateTime;
	data['circle_pass_id'] = entity.circlePassId;
	data['role'] = entity.role;
	data['agent_name'] = entity.agentName;
	data['agent_avatar'] = entity.agentAvatar;
	data['agent_level'] = entity.agentLevel;
	data['is_collect'] = entity.isCollect;
	data['is_point'] = entity.isPoint;
	if (entity.image != null) {
		data['image'] =  [];
	}
	if (entity.comment != null) {
		data['comment'] =  entity.comment.map((v) => v.toJson()).toList();
	}
	data['point_num'] = entity.pointNum;
	data['agent_level_name'] = entity.agentLevelName;
	return data;
}

homeModelDataListCommantFromJson(HomeModelDataListCommant data, Map<String, dynamic> json) {
	if (json['circle_id'] != null) {
		data.circleId = json['circle_id']?.toInt();
	}
	if (json['agent_id'] != null) {
		data.agentId = json['agent_id']?.toInt();
	}
	if (json['comment_id'] != null) {
		data.commentId = json['comment_id']?.toInt();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['circle_role_id'] != null) {
		data.circleRoleId = json['circle_role_id']?.toInt();
	}
	if (json['agent_name'] != null) {
		data.agentName = json['agent_name']?.toString();
	}
	if (json['agent_avatar'] != null) {
		data.agentAvatar = json['agent_avatar']?.toString();
	}
	if (json['agent_level'] != null) {
		data.agentLevel = json['agent_level']?.toInt();
	}
	if (json['agent_level_name'] != null) {
		data.agentLevelName = json['agent_level_name']?.toString();
	}
	return data;
}

Map<String, dynamic> homeModelDataListCommantToJson(HomeModelDataListCommant entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['circle_id'] = entity.circleId;
	data['agent_id'] = entity.agentId;
	data['comment_id'] = entity.commentId;
	data['content'] = entity.content;
	data['circle_role_id'] = entity.circleRoleId;
	data['agent_name'] = entity.agentName;
	data['agent_avatar'] = entity.agentAvatar;
	data['agent_level'] = entity.agentLevel;
	data['agent_level_name'] = entity.agentLevelName;
	return data;
}