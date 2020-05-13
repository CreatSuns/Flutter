import 'package:flutter_material/generated/json/base/json_convert_content.dart';
import 'package:flutter_material/generated/json/base/json_filed.dart';

class HomeCommentModelEntity with JsonConvert<HomeCommentModelEntity> {
	int status;
	String msg;
	HomeCommentModelData data;
}

class HomeCommentModelData with JsonConvert<HomeCommentModelData> {
	HomeCommentModelDataPage page;
	@JSONField(name: "list")
	List<HomeCommantModelDataList> xList;
}

class HomeCommentModelDataPage with JsonConvert<HomeCommentModelDataPage> {
	int current;
	int total;
	int count;
}

class HomeCommantModelDataList with JsonConvert<HomeCommantModelDataList> {
	@JSONField(name: "comment_id")
	int commentId;
	@JSONField(name: "admin_id")
	int adminId;
	@JSONField(name: "agent_id")
	int agentId;
	@JSONField(name: "circle_id")
	int circleId;
	String content;
	@JSONField(name: "circle_role_id")
	int circleRoleId;
	@JSONField(name: "create_time")
	String createTime;
	@JSONField(name: "update_time")
	String updateTime;
	@JSONField(name: "agent_name")
	String agentName;
	@JSONField(name: "agent_avatar")
	String agentAvatar;
	@JSONField(name: "agent_level_name")
	String agentLevelName;
}
