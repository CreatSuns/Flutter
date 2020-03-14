import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SendDynamic extends StatefulWidget {
  @override
  _SendDynamicState createState() => _SendDynamicState();
}

class _SendDynamicState extends State<SendDynamic> {

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发动态'),
      ),
      body: FlatButton(onPressed: getImage, child: Text('选择图片')),
    );
  }
}
