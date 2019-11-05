class LoginEntity {
	String msg;
	LoginData data;
	int status;

	LoginEntity({this.msg, this.data, this.status});

	LoginEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['status'] = this.status;
		return data;
	}
}

class LoginData {
	String accessToken;
	List<LoginDataAgent> agent;
	int userId;
	String loginTime;
	int expirationTime;
	String mobile;
	String source;

	LoginData({this.accessToken, this.agent, this.userId, this.loginTime, this.expirationTime, this.mobile, this.source});

	LoginData.fromJson(Map<String, dynamic> json) {
		accessToken = json['access_token'];
		if (json['agent'] != null) {
			agent = new List<LoginDataAgent>();(json['agent'] as List).forEach((v) { agent.add(new LoginDataAgent.fromJson(v)); });
		}
		userId = json['user_id'];
		loginTime = json['login_time'];
		expirationTime = json['expiration_time'];
		mobile = json['mobile'];
		source = json['source'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['access_token'] = this.accessToken;
		if (this.agent != null) {
      data['agent'] =  this.agent.map((v) => v.toJson()).toList();
    }
		data['user_id'] = this.userId;
		data['login_time'] = this.loginTime;
		data['expiration_time'] = this.expirationTime;
		data['mobile'] = this.mobile;
		data['source'] = this.source;
		return data;
	}
}

class LoginDataAgent {
	int memberId;
	String agentName;
	int agentId;
	int systemId;
	String prefixMobile;
	String agentMobile;
	int merchantId;
	String brandLogo;
	String agentAvatar;
	int agentLevel;
	String agentLevelName;
	String agentLevelWord;
	String productLineName;
	int adminId;
	String companyName;
	String agentWechat;

	LoginDataAgent({this.memberId, this.agentName, this.agentId, this.systemId, this.prefixMobile, this.agentMobile, this.merchantId, this.brandLogo, this.agentAvatar, this.agentLevel, this.agentLevelName, this.agentLevelWord, this.productLineName, this.adminId, this.companyName, this.agentWechat});

	LoginDataAgent.fromJson(Map<String, dynamic> json) {
		memberId = json['member_id'];
		agentName = json['agent_name'];
		agentId = json['agent_id'];
		systemId = json['system_id'];
		prefixMobile = json['prefix_mobile'];
		agentMobile = json['agent_mobile'];
		merchantId = json['merchant_id'];
		brandLogo = json['brand_logo'];
		agentAvatar = json['agent_avatar'];
		agentLevel = json['agent_level'];
		agentLevelName = json['agent_level_name'];
		agentLevelWord = json['agent_level_word'];
		productLineName = json['product_line_name'];
		adminId = json['admin_id'];
		companyName = json['company_name'];
		agentWechat = json['agent_wechat'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['member_id'] = this.memberId;
		data['agent_name'] = this.agentName;
		data['agent_id'] = this.agentId;
		data['system_id'] = this.systemId;
		data['prefix_mobile'] = this.prefixMobile;
		data['agent_mobile'] = this.agentMobile;
		data['merchant_id'] = this.merchantId;
		data['brand_logo'] = this.brandLogo;
		data['agent_avatar'] = this.agentAvatar;
		data['agent_level'] = this.agentLevel;
		data['agent_level_name'] = this.agentLevelName;
		data['agent_level_word'] = this.agentLevelWord;
		data['product_line_name'] = this.productLineName;
		data['admin_id'] = this.adminId;
		data['company_name'] = this.companyName;
		data['agent_wechat'] = this.agentWechat;
		return data;
	}
}
