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
  int _currentPage = 0;

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

    _dots[_currentPage] = dot(AppColor.primaryColor);

    return Column(
      children: <Widget>[
        Container(
          height: 120.0,
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _slideA(),
              _slideB(),
              _slideC(),
              _slideD(),
            ],
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
    setState(() {
      _currentPage = index;
      print('Current Page: ' + _currentPage.toString());
    });
  }

  _slideA() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('https://i.imgur.com/c7Uvh6h.jpg'),
              fit: BoxFit.cover)),
      child: Center(
          child: InkWell(
              onTap: () {
                Fluttertoast.showToast(
                    msg: 'Clicked to Slide A',
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

  _slideB() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.shopify.com/s/files/1/0810/8331/files/category_banner_ip8.jpg?1347021331059137510'),
              fit: BoxFit.cover)),
      child: Center(
          child: InkWell(
              onTap: () {
                Fluttertoast.showToast(
                    msg: 'Clicked to Slide B',
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

  _slideC() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('https://i.imgur.com/gAumC4V.jpg'),
              fit: BoxFit.cover)),
      child: Center(
          child: InkWell(
              onTap: () {
                Fluttertoast.showToast(
                    msg: 'Clicked to Slide C',
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

  _slideD() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('https://i.imgur.com/n7g3Naf.jpg'),
              fit: BoxFit.cover)),
      child: Center(
          child: InkWell(
              onTap: () {
                Fluttertoast.showToast(
                    msg: 'Clicked to Slide D',
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
