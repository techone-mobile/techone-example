import 'package:flutter/material.dart';
import 'package:techone/ui/fragment/FlashDeals.dart';
import 'package:techone/ui/fragment/MostSell.dart';
import 'package:techone/ui/fragment/NewProduct.dart';
import 'package:techone/ui/fragment/SuggestionsProduct.dart';
import '../fragment/SlideShow.dart';
import '../fragment/Category.dart';
import 'SearchUI.dart';

class HomeUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomeUIState();
  }
}

class _MyHomeUIState extends State<HomeUI> {
  final TextEditingController _textEditingController =
      TextEditingController();
  final FocusNode _focusNode = FocusNode();

  _nestedScrollViewController() {}

  TextField _appBarTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appBarTitle = TextField(
        controller: _textEditingController,
        focusNode: _focusNode,
        onTap: (){
          print('Taped to search');
          _focusNode.unfocus();
          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchUI()));
        },
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
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: NestedScrollView(
        controller: _nestedScrollViewController(),
        headerSliverBuilder: (context, isScrolled) {
          return <Widget>[
            SliverAppBar(
              title: _appBarTitle,
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () {})
              ],
              pinned: false,
              floating: true,
              forceElevated: isScrolled,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SlideShow(),
              Container(
                child: Category(),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: FlashDeals(),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: NewProduct(),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: MostSell(),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: SuggestionsProduct(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
