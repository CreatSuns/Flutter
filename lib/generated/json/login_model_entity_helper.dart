import 'package:flutter_material/models/login/login_model_entity.dart';

loginModelEntityFromJson(LoginModelEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new LoginModelData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> loginModelEntityToJson(LoginModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

loginModelDataFromJson(LoginModelData data, Map<String, dynamic> json) {
	if (json['user_id'] != null) {
		data.userId = json['user_id']?.toInt();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile']?.toString();
	}
	if (json['access_token'] != null) {
		data.accessToken = json['access_token']?.toString();
	}
	if (json['login_time'] != null) {
		data.loginTime = json['login_time']?.toString();
	}
	if (json['expiration_time'] != null) {
		data.expirationTime = json['expiration_time']?.toInt();
	}
	if (json['agent'] != null) {
		data.agent = new List<LoginModelDataAgent>();
		(json['agent'] as List).forEach((v) {
			data.agent.add(new LoginModelDataAgent().fromJson(v));
		});
	}
	if (json['source'] != null) {
		data.source = json['source']?.toString();
	}
	return data;
}

Map<String, dynamic> loginModelDataToJson(LoginModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['user_id'] = entity.userId;
	data['mobile'] = entity.mobile;
	data['access_token'] = entity.accessToken;
	data['login_time'] = entity.loginTime;
	data['expiration_time'] = entity.expirationTime;
	if (entity.agent != null) {
		data['agent'] =  entity.agent.map((v) => v.toJson()).toList();
	}
	data['source'] = entity.source;
	return data;
}

loginModelDataAgentFromJson(LoginModelDataAgent data, Map<String, dynamic> json) {
	if (json['agent_name'] != null) {
		data.agentName = json['agent_name']?.toString();
	}
	if (json['prefix_mobile'] != null) {
		data.prefixMobile = json['prefix_mobile']?.toString();
	}
	if (json['agent_mobile'] != null) {
		data.agentMobile = json['agent_mobile']?.toString();
	}
	if (json['agent_avatar'] != null) {
		data.agentAvatar = json['agent_avatar']?.toString();
	}
	if (json['admin_id'] != null) {
		data.adminId = json['admin_id']?.toInt();
	}
	if (json['agent_level'] != null) {
		data.agentLevel = json['agent_level']?.toInt();
	}
	if (json['agent_wechat'] != null) {
		data.agentWechat = json['agent_wechat']?.toString();
	}
	if (json['agent_id'] != null) {
		data.agentId = json['agent_id']?.toInt();
	}
	if (json['system_id'] != null) {
		data.systemId = json['system_id']?.toInt();
	}
	if (json['agent_level_name'] != null) {
		data.agentLevelName = json['agent_level_name']?.toString();
	}
	if (json['agent_level_word'] != null) {
		data.agentLevelWord = json['agent_level_word']?.toString();
	}
	if (json['merchant_id'] != null) {
		data.merchantId = json['merchant_id']?.toInt();
	}
	if (json['product_line_name'] != null) {
		data.productLineName = json['product_line_name']?.toString();
	}
	if (json['company_name'] != null) {
		data.companyName = json['company_name']?.toString();
	}
	if (json['brand_logo'] != null) {
		data.brandLogo = json['brand_logo']?.toString();
	}
	if (json['member_id'] != null) {
		data.memberId = json['member_id']?.toInt();
	}
	if (json['isSelect'] != null) {
		data.isSelect = json['isSelect'] == 1 ? true : false;
	}
	return data;
}

Map<String, dynamic> loginModelDataAgentToJson(LoginModelDataAgent entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['agent_name'] = entity.agentName;
	data['prefix_mobile'] = entity.prefixMobile;
	data['agent_mobile'] = entity.agentMobile;
	data['agent_avatar'] = entity.agentAvatar;
	data['admin_id'] = entity.adminId;
	data['agent_level'] = entity.agentLevel;
	data['agent_wechat'] = entity.agentWechat;
	data['agent_id'] = entity.agentId;
	data['system_id'] = entity.systemId;
	data['agent_level_name'] = entity.agentLevelName;
	data['agent_level_word'] = entity.agentLevelWord;
	data['merchant_id'] = entity.merchantId;
	data['product_line_name'] = entity.productLineName;
	data['company_name'] = entity.companyName;
	data['brand_logo'] = entity.brandLogo;
	data['member_id'] = entity.memberId;
	data['isSelect'] = entity.isSelect;
	return data;
}