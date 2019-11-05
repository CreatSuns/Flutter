import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material/CustomWidget/CustomWidget.dart';
import 'package:flutter_material/Root/RootWidget.dart';
import 'package:flutter_material/models/login_entity.dart';


typedef GetInputText = Function(String text);

class Login  extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static const platform = const MethodChannel('material.flutter.io/deviceToken');
  String _deviceToken = '';

  void _getDeviceToken() async {
    String dt;
    try {
      final result = await platform.invokeMethod('getDviceTokenNative');
      print("---- $result ---");
      dt = result;
    } on PlatformException catch (e) {
      dt = 'token有误';
    }
    setState(() {
      _deviceToken = dt;
    });
  }

  String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  String getRandomNumber(int index) {
    String alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String left = '';
    for (var i = 0; i < index; i++) {
//    right = right + (min + (Random().nextInt(max - min))).toString();
      left = left + alphabet[Random().nextInt(alphabet.length)];
    }
    return left;
  }

  String paramsCompare(Map params){
    print('map-----$params----');
    var list = params.keys.toList();
      print(list);
      list.sort();
      print(list);

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
          resultList.add('$key=$value');
        }
      }
      String result = '${resultList.join('&')}il3qTF7xaXLsiXff4YqYCeNrsI9Ne3ev';
      print('result====$result======');
      return generateMd5(result);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _getDeviceToken();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    HttpClient httpClient = HttpClient();
    String userName;
    String password;

    void _login() async{
      String url = 'https://gateway-mobile.wyawds.com/api/material-app/material-login.json';
      var deviceInfo = DeviceInfoPlugin();
      var iosInfo = await deviceInfo.iosInfo;

      Map params = {
      'mobile': '17858629460',
      'pwd': '123456',
      'device_token': '',
      'device_type': 1,
      'timestamp': '${((DateTime.now().millisecondsSinceEpoch) / 1000).toInt()}',
      'nonce_str': getRandomNumber(32),
      };
      
      try {
        String str = paramsCompare(params);
        print('-----str----$str-----');
        var baseOption = BaseOptions(
            headers: {
              'version' : '1.0.5',
              'platform' : 'ios13.1',
              'sign' : str,
            },
          contentType: "application/json",
          responseType: ResponseType.plain,
        );
        var response = await Dio(baseOption).post(
            url,
            data: params,
        );
        print(response.data);
        LoginEntity loginModel = json.decode(response.data);
        print(loginModel.msg);
//        print(json.decode(response.data));

      } catch (error) {
        print('error-----$error----');
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.4,
              child: Image(
                image: AssetImage('images/750-1334.png'),
                width: width,
                height: height,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: <Widget>[
                LoginTitle(),
                InputWidget(
                  title: '手机号码',
                  placeholder: '请输入手机号',
                  bottomPadding: 30,
                  textBuild: (text){
                    userName = text;
                  },
                ),
                InputWidget(
                  title: '密码',
                  placeholder: '请输入密码',
                  bottomPadding: 10,
                  textBuild: (text){
                    password = text;
                  },
                ),
                UserAgreementWidget(),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: CupertinoButton(
                      child: Text('登录'),
                      color: Colors.blue,
                      disabledColor: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      onPressed: () {
                        _login();
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => RootWidget(),
//                          ),
//                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class LoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 80, 100, 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('images/icon_reviewLogo.png'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              '云素材',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputWidget extends StatefulWidget {
  InputWidget({
    Key key,
    @required this.title,
    @required this.placeholder,
    this.bottomPadding = 0,
    this.textBuild,
  })  : assert(title != null),
        assert(placeholder != null),
        super(key: key);

  final String title;
  final String placeholder;
  final double bottomPadding;
  GetInputText textBuild;
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final vc = TextEditingController();
  final focusNode = FocusNode();
  var showMis = false;

  @override
  void initState() {
    // TODO: implement initState
    focusNode.addListener((){
      setState(() {
        if(!focusNode.hasFocus) {
          showMis = false;
        } else {
          showMis = true;
        }
      });
    });
    super.initState();
  }

  void showMistake() {
    setState(() {
      if (showMis == true) {
        showMis = false;
      } else {
        showMis = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, widget.bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${widget.title}',
          ),
          TextField(
            controller: vc,
            focusNode: focusNode,
            style: TextStyle(),
            decoration: InputDecoration(
              hintText: '${widget.placeholder}',
              hintStyle: TextStyle(
                fontSize: 20,
              ),
              suffixIcon: showMis ? Icon(Icons.close) : null,
//              focusColor: Colors.red,
            ),
            onChanged: widget.textBuild,
          ),
        ],
      ),
    );
  }
}

class UserAgreementWidget extends StatefulWidget {
  @override
  _UserAgreementWidgetState createState() => _UserAgreementWidgetState();
}

class _UserAgreementWidgetState extends State<UserAgreementWidget> {
  var select = false;

  void changeState(bool value) {
    setState(() {
      select = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          RoundCheckBox(
            value: select,
            onChanged: changeState,
          ),
          Text.rich(TextSpan(
            children: [
              TextSpan(
                  text: '我已阅读并同意',
                  style: TextStyle(
                    fontSize: 12,
                  )),
              TextSpan(
                text: '《云素材软件许可及服务协议》',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
                recognizer: null,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
