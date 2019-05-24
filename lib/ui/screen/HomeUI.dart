import 'package:flutter/material.dart';
import 'package:techone/ui/fragment/FlashDeals.dart';
import 'package:techone/ui/fragment/MostSell.dart';
import '../fragment/SlideShow.dart';
import '../fragment/Category.dart';

final TextEditingController _textEditingController = TextEditingController();
final FocusNode _focusNode = FocusNode();

_nestedScrollViewController() {}

final TextField _appBarTitle = TextField(
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

HomeUI() {
  return NestedScrollView(
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
            child: MostSell(),
          )
        ],
      ),
    ),
  );
}
