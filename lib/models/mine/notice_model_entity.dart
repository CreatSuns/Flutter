import 'package:flutter_material/generated/json/base/json_convert_content.dart';
import 'package:flutter_material/generated/json/base/json_filed.dart';

class NoticeModelEntity with JsonConvert<NoticeModelEntity> {
	int status;
	String msg;
	NoticeModelEntityData data;
}

class NoticeModelEntityData with JsonConvert<NoticeModelEntityData> {
	NoticeModelEntityDataPage page;
	@JSONField(name: "list")
	List<NoticeModelEntityDataList> xList;
}

class NoticeModelEntityDataPage with JsonConvert<NoticeModelEntityDataPage> {
	int current;
	int total;
	int count;
}

class NoticeModelEntityDataList with JsonConvert<NoticeModelEntityDataList> {
	@JSONField(name: "notice_id")
	int noticeId;
	String content;
	@JSONField(name: "create_time")
	String createTime;
	@JSONField(name: "end_time")
	String endTime;
	@JSONField(name: "is_read")
	int isRead;
}
