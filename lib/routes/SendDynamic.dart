import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SendDynamic extends StatefulWidget {
  @override
  _SendDynamicState createState() => _SendDynamicState();
}

class _SendDynamicState extends State<SendDynamic> {
  final vc = TextEditingController();
  List<Widget> images = [];

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      images.add(Image.file(image));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发动态'),
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: vc,
                maxLines: 7,
                maxLength: 300,
                decoration: InputDecoration(
                    hintText: '此时此刻你的想法。。。',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Color(int.parse('bbbbbb', radix: 16)).withAlpha(255),
                    ),
                    filled: true,
                    fillColor:
                    Color(int.parse('f7f7f7', radix: 16)).withAlpha(255),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.symmetric(vertical: 2)),
              ),
            ),
            SizedBox(
              height: ((images.length + 1) / 3 + 1) * 100 ,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: images.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == images.length) {
                      return FlatButton(onPressed: getImage, child: Text('选择图片'));
                    } else {
                      return images[index];
                    }
                  }),
            ),
            MaterialButton(
              height: 60,
              color: Colors.white,
              onPressed: (){},
              child: Row(
                children: <Widget>[
                  Text('谁可以看'),
                  Text('aaa'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
