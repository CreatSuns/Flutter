import 'package:flutter_material/generated/json/base/json_convert_content.dart';
import 'package:flutter_material/generated/json/base/json_filed.dart';

class HomeCoverImageEntity with JsonConvert<HomeCoverImageEntity> {
	int status;
	String msg;
	HomeCoverImageData data;
}

class HomeCoverImageData with JsonConvert<HomeCoverImageData> {
	@JSONField(name: "cover_image")
	String coverImage;
}
