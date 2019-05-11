import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Dot.dart';
import '../style/AppColor.dart';

class SlideShow extends StatefulWidget {
  @override
  createState() => _MySlideState();
}

class _MySlideState extends State<SlideShow> {
  PageController _pageController = PageController();
  List<Widget> _dots;
  List<Widget> _slides;
  int _currentPage = 0;
  Duration duration = Duration(seconds: 5);
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // after widget created
    _onPageChange(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return slideShow();
  }

  slideShow() {
    _dots = [
      dot(Colors.black54),
      dot(Colors.black54),
      dot(Colors.black54),
      dot(Colors.black54),
    ];

    _slides = [
      _slide('https://i.imgur.com/c7Uvh6h.jpg', 'A'),
      _slide('https://cdn.shopify.com/s/files/1/0810/8331/files/category_banner_ip8.jpg?1347021331059137510', 'B'),
      _slide('https://i.imgur.com/gAumC4V.jpg', 'C'),
      _slide('https://i.imgur.com/n7g3Naf.jpg', 'D'),
    ];

    _dots[_currentPage] = dot(AppColor.primaryColor);

    return Column(
      children: <Widget>[
        Container(
          height: 120.0,
            child: PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: _slides,
            onPageChanged: (index) {
              _onPageChange(index);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _dots,
        )
      ],
    );
  }

  _onPageChange(index) {
    if(_timer != null && _timer.isActive)
      _timer.cancel();

    setState(() {
      _currentPage = index;
      print('Current Page: ' + _currentPage.toString());
    });

    _timer = Timer.periodic(duration, (timer) {
      _currentPage++;

      if(_currentPage >=   _slides.length)
        _currentPage = 0;

      _pageController.jumpToPage(_currentPage);
      timer.cancel();
    });
  }

  _slide(String url, String name) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover)),
      child: Center(
          child: InkWell(
              onTap: () {
                Fluttertoast.showToast(
                    msg: 'Clicked to slide ' + name,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.black87,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Center())),
    );
  }
}
