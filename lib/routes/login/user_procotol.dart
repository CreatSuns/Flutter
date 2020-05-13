import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class UserProcotol extends StatelessWidget {
  Future<String> _getFile() async {
    return await rootBundle.loadString('resources/userProcotol.html');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getFile(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return WebviewScaffold(
              appBar: AppBar(
                title: Text('用户协议'),
              ),
              appCacheEnabled: true,
              withLocalUrl: true,
              hidden: true,
              allowFileURLs: true,
              url: Uri.dataFromString(snapshot.data,
                      mimeType: 'text/html',
                      encoding: Encoding.getByName('utf-8'))
                  .toString(),
              initialChild: Container(
                color: Colors.white,
                child: Center(
                  child: Text('文档正在获取中...'),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
