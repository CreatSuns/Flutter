import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material/commons/BaseColors.dart';
import 'package:tableview/tableview.dart';

class MaterialWidget extends StatefulWidget {
  @override
  _MaterialState createState() => _MaterialState();
}

class _MaterialState extends State<MaterialWidget>
    with SingleTickerProviderStateMixin {
  // 顶部tab选项卡
  List<String> tabTitles = ['素材', '文章'];
  TabController _tabController;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabTitles.length, vsync: this)
    ..addListener(() {
        setState(() {
          selectedIndex = _tabController.index;
        });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.colorF6F6F6,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: BaseColors.colorBlack,
        title: Text(
          '素材库', style: TextStyle(color: BaseColors.colorWhite, fontSize: 18),),
        actions: selectedIndex == 0? [
          GestureDetector(
            onTap: () {
              print('筛选');
            },
            child: Image.asset('images/icon_filter.png'),
          ),
          GestureDetector(
            onTap: () {
              print('发布');
            },
            child: Image.asset('images/icon_release.png',),
          )
        ]:null,
        bottom: TabBar(
          onTap: (value){
            setState(() {
              selectedIndex = value;
            });
          },
          indicatorColor: BaseColors.colorE7C083, // 下划线颜色
          indicatorWeight: 2, // 下划线高度
          labelColor: BaseColors.colorE7C083, // 字体颜色
          labelStyle: TextStyle(fontSize: 15), // 字体大小
          indicatorSize: TabBarIndicatorSize.label, // 设置跟文字等宽
          indicatorPadding: EdgeInsets.only(bottom: 1),
          tabs: tabTitles.map((title) => Tab(text: title,)).toList(),
          controller: _tabController,
        ),

      ),
      body: SafeArea(
        child: TabBarView(children: <Widget>[
          // 素材页面
          _getMaterialTableView(context),
          Text('文章'),
          // 文章页面
        ],
        controller: _tabController,),
      ),
    );
  }
  
  /// 获取素材展示视图
  _getMaterialTableView(BuildContext context){
    return TableView(sectionNumber: 1, numberRowOfSection: (BuildContext context, int index){
      return 3;
    }, rowView: (BuildContext context, int section, int row){
      return Text('adasda');
    });
  }
  
}
