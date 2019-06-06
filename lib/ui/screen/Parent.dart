import 'package:flutter/material.dart';
import 'Account.dart';
import 'HomeUI.dart';
import '../../values/Values.dart';
import 'SearchUI.dart';

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
    SearchUI(),
    Center(
      child: Text('Notification'),
    ),
    Account(),
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
        resizeToAvoidBottomPadding: false,
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
