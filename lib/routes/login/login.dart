import 'package:cache/sharepreferences_until.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_material/models/login/login_network_query.dart';
import 'package:flutter_material/routes/RootWidget.dart';
import 'package:round_checkbox/round_checkbox.dart';
import 'package:toast/toast.dart';

typedef GetInputText = Function(String text);
typedef TextComplete = Function();

const String userAgreeProtocol = 'userAgreeProtocol';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String userName;
  String password;
  bool isSelectUserProtocol = false;
  String errorInfo;
  FocusNode nameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusScopeNode focusScopeNode;

  bool _checkLoginInfo() {
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

  void goLogin(BuildContext context) async {
    var pass = _checkLoginInfo();
    if (pass == false) return;
    await CustomToast.showLoading(msg: '正在登陆...');
    Map<String, dynamic> params = {
      'mobile_prefix': '+86',
      'mobile': userName,
      'pwd': password,
    };
    var model = await LoginNetWorkQuery.login(params);
    print(model);
    await CustomToast.cancelLoading();
    if (model == null) {
    } else {
      if (model.data.agent.length > 1) {
        // 选择产品线
        Navigator.of(context)
            .pushNamed('productLine', arguments: model.data.agent);
      } else {
        // 直接进入登录界面
        runApp(RootWidget());
      }
    }
  }

  void getUserProtocol() async {
    bool aa = await ShardPreferences.localGet(userAgreeProtocol);
    if (aa != null) {
      setState(() {
        isSelectUserProtocol = aa;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserProtocol();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            nameFocusNode.unfocus();
            passwordFocusNode.unfocus();
          },
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
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  LoginTitle(),
                  InputWidget(
                    title: '手机号码',
                    placeholder: '请输入手机号',
                    bottomPadding: 30,
                    needLeftAreaCode: true,
                    focusNode: nameFocusNode,
                    textBuild: (text) {
                      userName = text;
                    },
                    textComplete: (){
                      if(null == focusScopeNode){
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(passwordFocusNode);
                    },
                  ),
                  InputWidget(
                    title: '密码',
                    placeholder: '请输入密码',
                    bottomPadding: 10,
                    needEncryption: true,
                    focusNode: passwordFocusNode,
                    textBuild: (text) {
                      password = text;
                    },
                    textComplete: (){
                      passwordFocusNode.unfocus();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: UserAgreementWidget(
                      select: isSelectUserProtocol,
                      changeUserProtocol: (change) {
                        ShardPreferences.localSave(userAgreeProtocol, change);
                        setState(() {
                          isSelectUserProtocol = change;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 350,
                      height: 50,
                      child: CupertinoButton(
                        child: Text('登录'),
                        color: Colors.blue,
                        disabledColor: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        onPressed: () => goLogin(context),
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
    this.needLeftAreaCode,
    this.needEncryption = false,
    this.bottomPadding = 0,
    this.textBuild,
    this.focusNode,
    this.textComplete,
  })  : assert(title != null),
        assert(placeholder != null),
        super(key: key);

  String title;
  String placeholder;
  double bottomPadding;
  bool needLeftAreaCode;
  bool needEncryption;
  FocusNode focusNode;
  TextComplete textComplete;
  GetInputText textBuild;

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final vc = TextEditingController();

//  final focusNode = FocusNode();
  var showMis = false;

  @override
  void initState() {
    // TODO: implement initState
    widget.focusNode.addListener(() {
      setState(() {
        if (!widget.focusNode.hasFocus) {
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              '${widget.title}',
            ),
          ),
          SizedBox(
            height: 44,
            child: TextField(
              controller: vc,
              obscureText: widget.needEncryption,
              focusNode: widget.focusNode,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                  hintText: '${widget.placeholder}',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white30,
                  ),
                  suffixIcon: showMis ? Icon(Icons.close) : null,
//                filled: true,
//                fillColor: Color(int.parse('f7f7f7', radix: 16)).withAlpha(255),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38, width: 1)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38, width: 1)),
                  contentPadding: widget.needLeftAreaCode == true
                      ? EdgeInsets.symmetric(vertical: 6)
                      : EdgeInsets.symmetric(horizontal: 0),
                  prefixIcon: widget.needLeftAreaCode == true
                      ? SizedBox(
                          width: 70,
                          child: InkWell(
                              onTap: () {
                                print('选择区号');
                              },
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '+86',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Image.asset(
                                      'images/icon_open.png',
                                      width: 10,
                                      height: 5,
                                    ),
                                  )
                                ],
                              )),
                        )
                      : null),
              onChanged: widget.textBuild,
              onEditingComplete: widget.textComplete,
            ),
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
    this.select,
    this.changeUserProtocol,
  }) : super(key: key);

  bool select;
  ChangeUserProtocol changeUserProtocol;

  @override
  Widget build(BuildContext context) {
    TapGestureRecognizer tap = TapGestureRecognizer();
    tap.onTap = (){
      Navigator.of(context).pushNamed('userProcotol');
    };
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 20),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: RoundCheckBox(
              value: select,
              onChanged: changeUserProtocol,
            ),
          ),
          Text.rich(TextSpan(
            children: [
              TextSpan(
                  text: '我已阅读并同意',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  )),
              TextSpan(
                text: '《云素材软件许可及服务协议》',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                recognizer: tap,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
