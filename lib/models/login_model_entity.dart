import 'package:flutter_material/generated/json/base/json_convert_content.dart';
import 'package:flutter_material/generated/json/base/json_filed.dart';

class LoginModelEntity with JsonConvert<LoginModelEntity> {
	int status;
	String msg;
	LoginModelData data;
}

class LoginModelData with JsonConvert<LoginModelData> {
	@JSONField(name: "user_id")
	int userId;
	String mobile;
	@JSONField(name: "access_token")
	String accessToken;
	@JSONField(name: "login_time")
	String loginTime;
	@JSONField(name: "expiration_time")
	int expirationTime;
	List<LoginModelDataAgent> agent;
	String source;
}

class LoginModelDataAgent with JsonConvert<LoginModelDataAgent> {
	@JSONField(name: "agent_name")
	String agentName;
	@JSONField(name: "prefix_mobile")
	String prefixMobile;
	@JSONField(name: "agent_mobile")
	String agentMobile;
	@JSONField(name: "agent_avatar")
	String agentAvatar;
	@JSONField(name: "admin_id")
	int adminId;
	@JSONField(name: "agent_level")
	int agentLevel;
	@JSONField(name: "agent_wechat")
	String agentWechat;
	@JSONField(name: "agent_id")
	int agentId;
	@JSONField(name: "system_id")
	int systemId;
	@JSONField(name: "agent_level_name")
	String agentLevelName;
	@JSONField(name: "agent_level_word")
	String agentLevelWord;
	@JSONField(name: "merchant_id")
	int merchantId;
	@JSONField(name: "product_line_name")
	String productLineName;
	@JSONField(name: "company_name")
	String companyName;
	@JSONField(name: "brand_logo")
	String brandLogo;
	@JSONField(name: "member_id")
	int memberId;
	bool isSelect;
}
