import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'HomeUI.dart';
import '../../values/Values.dart';

class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechOne',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyParentPage(title: 'TechOne'),
    );
  }
}

/*StatefulWidget is Widget with mutable*/
class MyParentPage extends StatefulWidget {
  MyParentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyParentPageState createState() => _MyParentPageState();
}

/*State is a manager of StatefulWidget*/
class _MyParentPageState extends State<MyParentPage>
    with SingleTickerProviderStateMixin {
  var _itemSelected = 0;
  TabController _tabController;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _tabController.animateTo(_itemSelected);

    return Scaffold(
        /*drawer: Drawer(
          child: ListView.builder(
              itemCount: Values.categoryNames.length + 1,
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
                          msg: Values.categoryNames[index - 1],
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
                        child: Text(Values.categoryNames[index - 1],
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                  );
                }
              }),
        ),*/
        bottomNavigationBar: BottomNavigationBar(
          items: Values.itemsBottomNavigationBar,
          onTap: (index) {
            _onBottomNavigationBarTap(index);
          },
          currentIndex: _itemSelected,
          selectedItemColor: Colors.red,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: <Widget>[
              _bodyUI[0],
              _bodyUI[1],
              _bodyUI[2],
              _bodyUI[3],
            ]));
  }
}
