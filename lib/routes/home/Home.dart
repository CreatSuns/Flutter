import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_keyboard_size/screen_height.dart';
import 'package:flutter_material/models/home/home_cover_image_entity.dart';
import 'package:flutter_material/models/home/home_model_entity.dart';
import 'package:flutter_material/models/home/home_network_query.dart';
import 'package:flutter_material/models/login/login_model_entity.dart';
import 'package:flutter_material/widgets/home/home_cell.dart';
import 'package:flutter_material/widgets/home/home_navbar.dart';
import 'package:flutter_material/widgets/home/home_section_foot.dart';

import 'package:tableview/tableview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  List<HomeModelDataList> list = [];
  String coverImageStr;
  LoginModelDataAgent agent;
  FocusNode node = FocusNode();
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  double alpha = 0.0;
  int lastOffset = 0;
  bool sss = false;

  void homeCover() async {
    LoginModelDataAgent model = await HomeNetworkQuery.getUserInfo();
    HomeCoverImageEntity entity = await HomeNetworkQuery.homeCoverImageQuery();
    setState(() {
      agent = model;
      coverImageStr = entity.data.coverImage;
    });
  }

  void homeData() async {
    HomeModelEntity model = await HomeNetworkQuery.homeListDataQuery({
      "circle_pass_id": 0,
      'pageSize': 10,
    });
    setState(() {
      list = model.data.xList;
    });
  }

  Widget agentIcon() {
    if (agent == null) {
      return Image.network(
          'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4');
    } else {
      return Image.network(
        agent.agentAvatar,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      );
    }
  }

  Widget tableHeaderView() {
    return SizedBox(
      height: 260,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          SizedBox(
            height: 260,
            child: Image(
              image: AssetImage('images/icon_bg_white.png'),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: coverImageStr == null
                ? null
                : Image(
                    image: NetworkImage(coverImageStr),
                    fit: BoxFit.fill,
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 280, top: 150),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: SizedBox(
                width: 80,
                height: 80,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: agentIcon(),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lastOffset = 0;
//    WidgetsBinding.instance.addObserver(this);
    scrollController.addListener(() {
      int offset = scrollController.offset ~/ 1;

      double aa = offset / 100;
      if (aa < 0) {
        aa = 0;
      } else if (aa > 1) {
        aa = 1;
      }
      if (aa != alpha) {
        setState(() {
          alpha = aa;
        });
      }
    });
    homeCover();
    homeData();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();

    homeCover();
  }

//  @override
//  void didChangeMetrics() {
//    super.didChangeMetrics();
//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      MediaQueryData data = MediaQuery.of(context);
//      print(data);
//      setState(() {
//        print(MediaQuery.of(context).viewInsets.bottom.toString());
//      });
//    });
//  }

  @override
  void dispose() {
//    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    print(ScreenHeight);
//    print('AAAAAAAAAAAA:' + MediaQuery.of(context).viewInsets.toString());
//    print('AAAAAAAAAAAA:' + MediaQuery.of(context).toString());
    return KeyboardSizeProvider(
      smallSize: 400.0,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
//            FutureBuilder(
//              future: homeData(),
//              builder: (BuildContext context, AsyncSnapshot snapshot) {
////                print(MediaQuery.of(context).viewInsets.toString() + 'aasd');
//                if (snapshot.connectionState == ConnectionState.done) {
//                  if (snapshot.hasError) {
//                    return Text('数据有误');
//                  } else {
//                    list = snapshot.data;
//
//                  }
//                } else {
//                  return Center(
//                    child: Text('等待网络'),
//                  );
//                }
//              },
//            ),
              TableView(
                scrollController: scrollController,
                tableHeaderView: tableHeaderView(),
                sectionNumber: 1,
                numberRowOfSection: (BuildContext context, int index) {
                  return list.length;
                },
                rowView: (BuildContext context, int section, int row) {
                  return Column(
                    children: [
                      HomeCell(
                        index: row,
                        data: list[row],
                        callback: () {
                          FocusScope.of(context).requestFocus(node);
                        },
                      ),
                      HomeSectionFoot(list[row].comment, moreComment: () {
                        Navigator.of(context)
                            .pushNamed('userAgent', arguments: list[row]);
                      }),
                    ],
                  );
                },
              ),
              HomeNavbar(
                alpha: alpha,
                top: MediaQuery.of(context).padding.top,
                canRelease: true,
              ),
              Consumer<ScreenHeight>(builder: (context, value, child) {
                print(
                    'value:${value.keyboardHeight}, ${value.screenHeight}, ${value.isSmall}, ${value.isOpen}');
                return Padding(
                  padding: EdgeInsets.only(top: 620),
                  child: TextField(
                    controller: controller,
                    focusNode: node,
                    decoration: InputDecoration(
                      hintText: '请输入内容',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1)),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
