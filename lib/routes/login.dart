import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_material/models/login_network_query.dart';
import 'package:flutter_material/routes/RootWidget.dart';
import 'package:round_checkbox/round_checkbox.dart';

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
      },
    );
  }

  void goLogin(BuildContext context) async {
    var pass = _checkLoginInfo();
    if (pass == false) return;
    showLoginProgress(context);
    Map<String, dynamic> params = {
      'mobile_prefix' : '+86',
      'mobile': userName,
      'pwd': password,
    };
    var model = await LoginNetWorkQuery.login(params);
    print(model);
    Navigator.of(context).pop();
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
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
//            focusNodeUserName.unfocus();
//            focusNodePassWord.unfocus();
            FocusScope.of(context).requestFocus(FocusNode());
//            FocusScope.of(context).requestFocus(focusNodePassWord);
          },
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
                width: width,
                height: height,
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
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: CupertinoButton(
                        child: Text('登录'),
                        color: Colors.blue,
                        disabledColor: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        onPressed: () => goLogin(context),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height - 60),
                child: UserAgreementWidget(
                  select: isSelectUserProtocol,
                  changeUserProtocol: (change) {
                    setState(() {
                      isSelectUserProtocol = change;
                    });
                  },
                ),
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
      padding: EdgeInsets.only(top: 100, bottom: 30),
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('images/icon_logo.png'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Image(
              image: AssetImage('images/icon_text.png'),
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
    this.bottomPadding = 0,
    this.textBuild,
  })  : assert(title != null),
        assert(placeholder != null),
        super(key: key);

  final String title;
  final String placeholder;
  final double bottomPadding;
  final bool needLeftAreaCode;
  final focusNode = FocusNode();
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
          TextField(
            controller: vc,
            focusNode: widget.focusNode,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
                hintText: '${widget.placeholder}',
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Color(int.parse('bbbbbb', radix: 16)).withAlpha(255),
                ),
                suffixIcon: showMis ? Icon(Icons.close) : null,
                filled: true,
                fillColor: Color(int.parse('f7f7f7', radix: 16)).withAlpha(255),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide.none),
                contentPadding: widget.needLeftAreaCode == true
                    ? EdgeInsets.symmetric(vertical: 2)
                    : EdgeInsets.symmetric(horizontal: 10),
                prefixIcon: widget.needLeftAreaCode == true
                    ? SizedBox(
                        width: 100,
                        child: FlatButton(
                            onPressed: () {
                              print('选择区号');
                            },
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '+86',
                                  style: TextStyle(
                                    color: Colors.black,
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RoundCheckBox(
            value: select,
            onChanged: changeUserProtocol,
          ),
          Container(
            width: 280,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '我已阅读并同意',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      )),
                  TextSpan(
                    text: '《云素材软件许可及服务协议》',
                    style: TextStyle(
                      color:
                          Color(int.parse('576b95', radix: 16)).withAlpha(255),
                      fontSize: 12,
                    ),
                    recognizer: null,
                  ),
                  TextSpan(
                    text: '和',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '《云素材隐私协议》',
                    style: TextStyle(
                      color:
                          Color(int.parse('576b95', radix: 16)).withAlpha(255),
                      fontSize: 12,
                    ),
                    recognizer: null,
                  ),
                ],
              ),
//              softWrap: true,
//              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
