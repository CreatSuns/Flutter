import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/services.dart';
import 'package:flutter_material/CustomWidget/CustomWidget.dart';
import 'package:flutter_material/commons/Network.dart';
import 'package:flutter_material/routes/RootWidget.dart';
import 'package:flutter_material/models/login_entity.dart';
import 'package:flutter_material/Until/localFile.dart';

typedef GetInputText = Function(String text);

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String userName;
  String password;
  bool isSelectUserProtocol = false;
  String errorInfo;

  bool _checkLoginInfo(BuildContext context) {
    print('开始');
    if (userName != null && password != null && isSelectUserProtocol == true) {
      print('开始1');
      return true;
    } else {
      if (userName == null || password == null) {
        print('开始2');
        setState(() {
          errorInfo = '用户名密码不能为空';
        });
      } else if (isSelectUserProtocol != true) {
        print('开始3');
        setState(() {
          errorInfo = '需要勾选用户协议';
        });
      }
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          errorInfo = null;
        });
      });
      return false;
    }
  }

  void _login() {
    Map<String, dynamic> params = {
      'mobile': userName,
      'pwd': password,
    };

    try {
      HttpQuerery.post('api/material-app/material-login.json', data: params,
          success: (data) {
        print('data=======$data=======');
        LoginEntity loginModel = LoginEntity.fromJson(json.decode(data));
        localSave('access_token', loginModel.data.accessToken);
        Navigator.of(context).pop();
        if (loginModel.data.agent.length > 1) {
          // 选择产品线
          Navigator.of(context).pushNamed('productLine', arguments: loginModel.data.agent);
        } else {
          // 直接进入登录界面
          runApp(RootWidget());
        }

      }, error: (string) {
            print('errorString-----$string----');
      });
    } catch (error) {
      print('error-----$error----');

    }
  }

  Future showLoginProgress(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: Text("正在登录，请稍后..."),
                )
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.3,
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
                  textBuild: (text) {
                    userName = text;
                  },
                ),
                InputWidget(
                  title: '密码',
                  placeholder: '请输入密码',
                  bottomPadding: 10,
                  textBuild: (text) {
                    password = text;
                  },
                ),
                UserAgreementWidget(
                  select: isSelectUserProtocol,
                  changeUserProtocol: (change) {
                    setState(() {
                      isSelectUserProtocol = change;
                    });
                  },
                ),
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
                        var pass = _checkLoginInfo(context);
                        if (pass == true) {
                          showLoginProgress(context);
                          _login();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 3 / 4),
              child: Center(
                child: Opacity(
                  opacity: 1,
                  child: Container(
                    width: 200,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: errorInfo == null ? null : Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(errorInfo == null ? '' : '$errorInfo'),
                  ),
                ),
              ),
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
    focusNode.addListener(() {
      setState(() {
        if (!focusNode.hasFocus) {
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    vc.dispose();
  }
}

typedef ChangeUserProtocol = Function(bool change);

class UserAgreementWidget extends StatelessWidget {
  UserAgreementWidget({
    Key key,
    this.select = false,
    this.changeUserProtocol,
  }) : super(key: key);

  bool select;
  ChangeUserProtocol changeUserProtocol;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          RoundCheckBox(
            value: select,
            onChanged: changeUserProtocol,
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
                  color: Colors.grey,
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
