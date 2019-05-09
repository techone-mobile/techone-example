import 'package:flutter/material.dart';
import '../../style/AppColor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../frangment/SlideShow.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechOne',
      theme: ThemeData(
        primarySwatch: AppColor.primaryColor,
      ),
      home: MyHomePage(title: 'TechOne'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final List<String> _category = [
    'Camera',
    'TV & Audio',
    'Laptop & Computer',
    'Accessories',
    'Smartphone & Table',
    'Printers & INK',
    'Game & Console',
    'Headphone'
  ];

  static final TextEditingController _textEditingController =
      TextEditingController();
  static final FocusNode _focusNode = FocusNode();

  _nestedScrollViewController(){}

  final TextField _appBarTitile = TextField(
      controller: _textEditingController,
      focusNode: _focusNode,
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: Colors.white,
      cursorRadius: Radius.circular(16),
      maxLines: 1,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: 'Search...',
          hintStyle:
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView.builder(
              itemCount: _category.length + 1,
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
                          msg: _category[index - 1],
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.black87,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );

                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(5),
                        child: Text(_category[index - 1],
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                  );
                }
              }),
        ),
        body: NestedScrollView(
            controller: _nestedScrollViewController(),
            headerSliverBuilder: (context, isScrolled)  {
              return <Widget>[
                SliverAppBar(
                  title: _appBarTitile,
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.shopping_cart, color: Colors.white),
                        onPressed: () {})
                  ],
                  pinned: true,
                  floating: true,
                  forceElevated: isScrolled,
                )
              ];
            },
            body: Center(
              child: Column(
                children: <Widget>[
                  SlideShow()
                ],
              ),
            )
        ));
  }
}
