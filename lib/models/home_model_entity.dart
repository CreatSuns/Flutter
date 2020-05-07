import 'package:flutter_material/generated/json/base/json_convert_content.dart';
import 'package:flutter_material/generated/json/base/json_filed.dart';

class HomeModelEntity with JsonConvert<HomeModelEntity> {
	int status;
	String msg;
	HomeModelData data;
}

class HomeModelData with JsonConvert<HomeModelData> {
	HomeModelDataPage page;
	@JSONField(name: "list")
	List<HomeModelDataList> xList;
}

class HomeModelDataPage with JsonConvert<HomeModelDataPage> {
	int current;
	int total;
	int count;
}

class HomeModelDataList with JsonConvert<HomeModelDataList> {
	@JSONField(name: "circle_id")
	int circleId;
	@JSONField(name: "admin_id")
	int adminId;
	@JSONField(name: "agent_id")
	int agentId;
	@JSONField(name: "circle_role_id")
	int circleRoleId;
	String content;
	@JSONField(name: "circle_status")
	int circleStatus;
	@JSONField(name: "base_point_number")
	int basePointNumber;
	@JSONField(name: "real_point_number")
	int realPointNumber;
	@JSONField(name: "create_time")
	String createTime;
	@JSONField(name: "update_time")
	String updateTime;
	@JSONField(name: "operate_time")
	String operateTime;
	@JSONField(name: "circle_pass_id")
	int circlePassId;
	int role;
	@JSONField(name: "agent_name")
	String agentName;
	@JSONField(name: "agent_avatar")
	String agentAvatar;
	@JSONField(name: "agent_level")
	int agentLevel;
	@JSONField(name: "is_collect")
	int isCollect;
	@JSONField(name: "is_point")
	int isPoint;
	List<dynamic> image;
	List<HomeModelDataListCommant> comment;
	@JSONField(name: "point_num")
	int pointNum;
	@JSONField(name: "agent_level_name")
	String agentLevelName;
}

class HomeModelDataListCommant with JsonConvert<HomeModelDataListCommant> {
	@JSONField(name: "circle_id")
	int circleId;
	@JSONField(name: "agent_id")
	int agentId;
	@JSONField(name: "comment_id")
	int commentId;
	String content;
	@JSONField(name: "circle_role_id")
	int circleRoleId;
	@JSONField(name: "agent_name")
	String agentName;
	@JSONField(name: "agent_avatar")
	String agentAvatar;
	@JSONField(name: "agent_level")
	int agentLevel;
	@JSONField(name: "agent_level_name")
	String agentLevelName;
}
