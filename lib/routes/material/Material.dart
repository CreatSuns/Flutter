import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material/ConstantFile.dart';

class MaterialWidget extends StatefulWidget {
  @override
  _MaterialState createState() => _MaterialState();
}

class _MaterialState extends State<MaterialWidget> {
  @override
  Widget build(BuildContext context) {
    var width = getScreenWidth(context) / 3;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/icon_collect.png'),
                        ),
                        Text('aaa'),
                      ],
                    ),
                  ),
                ),
                Expanded(child: RaisedButton(onPressed: (){}, child: Text('bbb'),),),
                Expanded(child: RaisedButton(onPressed: (){}, child: Text('ccc'),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
