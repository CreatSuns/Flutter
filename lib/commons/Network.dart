import 'dart:io';

import 'package:cache/sharepreferences_until.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:math';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

class BaseUrl {
  // 配置默认请求地址
  static const String url = 'https://gateway-mobile.wyawds.com/';
}

class HttpQuerery {

  static String generateMd5(String data) {
    var content = Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  static String getRandomNumber(int index) {
    String alphabet =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String left = '';
    for (var i = 0; i < index; i++) {
//    right = right + (min + (Random().nextInt(max - min))).toString();
      left = left + alphabet[Random().nextInt(alphabet.length)];
    }
    return left;
  }

  static String paramsCompare(Map params) {
    print('map-----$params----');
    var list = params.keys.toList();
    list.sort();

    var valueList = List();
    for (var key in list) {
      valueList.add(params[key]);
    }
    print(valueList);

    var resultList = List();
    for (var i = 0; i < valueList.length; i++) {
      var key = list[i];
      var value = valueList[i];
      if (value is List) {
        print('参数为数组');
      } else {
        if (value is String) {
          if(value.length > 0) {
            resultList.add('$key=$value');
          }
        } else {
          resultList.add('$key=$value');
        }
      }
    }
    String result = '${resultList.join('&')}il3qTF7xaXLsiXff4YqYCeNrsI9Ne3ev';
    print('result====$result======');
    return generateMd5(result);
  }

  static Future get(String url,
      {Map<String, dynamic> data,
      Map<String, dynamic> headers}) async {
    // 数据拼接
    if (data != null && data.isNotEmpty) {
      StringBuffer options = new StringBuffer('?');
      data.forEach((key, value) {
        options.write('${key}=${value}&');
      });
      String optionsStr = options.toString();
      optionsStr = optionsStr.substring(0, optionsStr.length - 1);
      url += optionsStr;
    }

    // 发送get请求
    return await _sendRequest(url, 'get', data: data,  headers: headers);
  }

  static Future post(String url,
      {Map<String, dynamic> data,
      Map<String, dynamic> headers}) async {
    // 发送post请求
    return await _sendRequest(url, 'post',
        data: data, headers: headers);
  }

  // 请求处理
  static Future _sendRequest(String url, String method,
      {Map<String, dynamic> data,
      Map<String, dynamic> headers}) async {
    int _code;
    String _msg;
    var _backData;

    // 检测请求地址是否是完整地址
    if (!url.startsWith('http')) {
      url = BaseUrl.url + url;
    }

    var deviceInfo = DeviceInfoPlugin();
    var platformName = 'ios';
    var platformVersion = '13';
//    if (Platform.isIOS) {
//      var iosInfo = await deviceInfo.iosInfo;
//      platformName = iosInfo.systemName;
//      platformVersion = iosInfo.systemVersion;
//      print('iosInfo=====${iosInfo.utsname.machine}===');
//    } else if (Platform.isAndroid) {
//      var androidInfo = await deviceInfo.androidInfo;
//      platformName = 'android';
//      platformVersion = androidInfo.version.release;
//      print('androidInfo===$androidInfo====');
//    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var token = await ShardPreferences.localGet('access_token');
    print('token==$token===');
    try {
      Map<String, dynamic> params = {
//        'device_token': "",
        'device_type': 1,
        'timestamp':
        '${((DateTime.now().millisecondsSinceEpoch) / 1000).toInt()}',
        'nonce_str': getRandomNumber(32),
      };

      if (data != null) {
        params.addAll(data);
      }

      Map<String, dynamic> httpHeader = {
        'version': packageInfo.version,
        'platform': platformName + platformVersion,
        'sign': paramsCompare(params),
      };

      if (token != null) {
        httpHeader['token'] = token;
      }

      if (headers != null) {
        httpHeader.addAll(headers);
      }


      print('requestHeader===$httpHeader====');
      print('requesParams===$params====');

      // 配置dio请求信息
      Response response;
      BaseOptions option = BaseOptions(
        connectTimeout: 10000, // 服务器链接超时，毫秒
        receiveTimeout: 3000, // 响应流上前后两次接受到数据的间隔，毫秒
        headers: httpHeader, // 添加headers,如需设置统一的headers信息也可在此添加
        contentType: "application/json",
        responseType: ResponseType.plain,
      );
      Dio dio = Dio(option);
      if (method == 'get') {
        response = await dio.get(url, queryParameters: params);
      } else {
        response = await dio.post(url, data: params);
      }
//      print('response===$response====');
//      if (response.statusCode != 200) {
//        _msg = '网络请求错误,状态码:' + response.statusCode.toString();
//        return _msg;
//      }

      // 返回结果处理
//      Map<String, dynamic> resCallbackMap = response.data;
//      _code = resCallbackMap['code'];
//      _msg = resCallbackMap['msg'];
//      _backData = resCallbackMap['data'];

      return response.data;

    } catch (exception) {
      return '数据请求错误：' + exception.toString();
    }
  }
}
