import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

_pageViewController() {}
List<Widget> _slides = List<Widget>();
List<String> _imgUrl = List<String>();

slideShow() {
  _setSlide();

  return PageView(
      controller: _pageViewController(),
      scrollDirection: Axis.horizontal,
      children: _slides);
}

_setSlide() {
  _imgUrl.add('https://i.imgur.com/c7Uvh6h.jpg');
  _imgUrl.add(
      'https://cdn.shopify.com/s/files/1/0810/8331/files/category_banner_ip8.jpg?1347021331059137510');
  _imgUrl.add('https://i.imgur.com/gAumC4V.jpg');
  _imgUrl.add('https://i.imgur.com/n7g3Naf.jpg');

  for (int i = 0; i < _imgUrl.length; i++) {
    _slides.add(Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(_imgUrl[i]), fit: BoxFit.cover)),
      child: Center(
          child: InkWell(
              onTap: () {
                Fluttertoast.showToast(
                    msg: 'Clicked to Slide ' + i.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.black87,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Center())),
    ));
  }
}
