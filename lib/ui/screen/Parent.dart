import 'package:flutter/material.dart';
import '../style/AppColor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'HomeUI.dart';
import '../../values/Values.dart';

class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechOne',
      theme: ThemeData(
        primarySwatch: AppColor.primaryColor,
      ),
      home: MyParentPage(title: 'TechOne'),
    );
  }
}

class MyParentPage extends StatefulWidget {
  MyParentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyParentPageState createState() => _MyParentPageState();
}

class _MyParentPageState extends State<MyParentPage> {
  var _itemSelected = 0;

  final _bodyUI = [
    HomeUI(),
    Center(
      child: Text('Search'),
    ),
    Center(
      child: Text('Notification'),
    ),
    Center(
      child: Text('Account'),
    ),
  ];

  _onBottomNavigationBarTap(int index) {
    print(_itemSelected);
    setState(() {
      _itemSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView.builder(
              itemCount: Values.category.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return DrawerHeader(
                    child: Text(
                      'TechOne',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    decoration: BoxDecoration(color: AppColor.primaryColor),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: Values.category[index - 1],
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.black87,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(5),
                        child: Text(Values.category[index - 1],
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                  );
                }
              }),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: Values.itemsBottomNavigationBar,
          onTap: (index) {
            _onBottomNavigationBarTap(index);
          },
          type: BottomNavigationBarType.fixed,
        ),
        body: _bodyUI[_itemSelected]);
  }
}
