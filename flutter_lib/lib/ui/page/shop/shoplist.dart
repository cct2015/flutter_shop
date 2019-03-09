import 'package:flutter/material.dart';
import 'package:flutter_lib/logic/bloc/tab_bloc.dart';
import 'package:flutter_lib/model/searchTab.dart';
import 'package:flutter_lib/logic/viewmodel/tab_view_model.dart';

class ShopList extends StatelessWidget {
//  const ShopList({Key key, this.title}) : super(key: key);
//  final title;

  @override
  Widget build(BuildContext context) {
    return ShopListPage();
  }
}

class ShopListPage extends StatefulWidget {
//  ShopListPage({Key key, this.title}) : super(key: key);
//  final String title;

  @override
  ShopListState createState() => ShopListState();
}

class ShopListState extends State<ShopListPage> {
  Widget appBarTitle;
  final TextEditingController _searchQuery = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: buildSearchAppBar(context),
        body: Container(),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  AppBar buildSearchAppBar(BuildContext context) {
    TabViewModel tabViewModel = TabViewModel();
    tabViewModel.getMenuItems();
    return new AppBar(
      centerTitle: true,
      title: new Container(
        width: 244,
        height: 28,
          decoration: new BoxDecoration(
          color:new Color(0xfff5f5f5),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(14),
          border: new Border.all(
            width: 5.0,
            color: new Color(0xfff5f5f5),
          ),
        ),
        child: new Center(
          child: new TextField(
            controller: _searchQuery,
            style: new TextStyle(
              color: Colors.grey,
            ),
            decoration: new InputDecoration(
                suffixIcon: new Icon(Icons.search, color: Colors.black),
                hintText: "请输入搜索内容",
                hintStyle: new TextStyle(color: Colors.white)),
          ),
        ),
      ),
      bottom: new TabBar(
        indicatorColor: Colors.transparent,
        isScrollable: false,
        labelColor: Colors.blue,
        onTap: (int i) {
          switch (i) {
            case 0:

              break;
            case 1:
              break;
          }
        },
        tabs: tabViewModel.tabItems.map((SearchTab choice) {
          return new Tab(
            child: new Row(
              children: <Widget>[
                Text(choice.title),
                Icon(
                  choice.icon,
                  color: choice.menuColor,
                ),
              ],
            ),
          );
        }).toList(),
      ),
      leading: new IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context, false),
      ),
      actions: <Widget>[
        new GestureDetector(
          onTap: () {
            _doSearch(_searchQuery);
          },
          child: new Container(
            width: 60.0,
            height: 28.0,
            margin: EdgeInsets.fromLTRB(14, 14, 14, 14),
            child: new Center(
              child: new Text(
                "搜索",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.red,
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(14),
              border: new Border.all(
                width: 5.0,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _doSearch(TextEditingController searchQuery) {
    searchQuery.addListener(() {
      if (searchQuery.text.isEmpty) {
        setState(() {});
      } else {
        setState(() {});
      }
    });
  }
}
