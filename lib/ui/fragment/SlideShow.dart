import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Dot.dart';
import '../../blocs/SlideBloc.dart';
import '../../models/SlideModel.dart';

class SlideShow extends StatefulWidget {
  @override
  createState() => _MySlideState();
}

class _MySlideState extends State<SlideShow> {
  PageController _pageController = PageController();
  List<Widget> _dots = List<Widget>();
  List<Widget> _slides = List<Widget>();
  int _currentPage = 0;
  Duration duration = Duration(seconds: 5);
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slideBloc.getAllSlide();
    _onPageChange(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return StreamBuilder(
      stream: slideBloc.stream(),
      builder: (context, snapshot) {
        if (!snapshot.hasError) {
          if (snapshot.hasData) {
            return _slideShow(snapshot.data);
          } else {
            print('No data');
            return _slideShow(snapshot.data);
          }
        } else {
          print(snapshot.error);
          return _slideShow(snapshot.data);
        }
      },
    );
  }

  _slideShow(List<SlideModel> slides) {

    if (_dots.isNotEmpty && _slides.isNotEmpty) {
      _dots.clear();
      _slides.clear();
    }

    if (slides != null && slides.isNotEmpty) {
      for (var slide in slides) {
        _dots.add(slide.dot);
        _slides.add(_slide(slide.urlImage, slide.name));
      }
    } else {
      _dots = [
        Dots.dot(Colors.black54),
        Dots.dot(Colors.black54),
        Dots.dot(Colors.black54),
        Dots.dot(Colors.black54),
      ];

      _slides = [
        _slide('', 'A'),
        _slide('', 'B'),
        _slide('', 'C'),
        _slide('', 'D'),
      ];
    }

    _dots[_currentPage] = Dots.dot(Colors.red);

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

      if(_currentPage >= _slides.length)
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
