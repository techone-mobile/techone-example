import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

_pageViewController() {}

slideShow() {
  return PageView(
    controller: _pageViewController(),
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      _slideA(),
      _slideB(),
      _slideC(),
    ],
  );
}

_slideA() {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://cdn.shopify.com/s/files/1/0810/8331/files/category_banner_ip8.jpg?1347021331059137510'),
            fit: BoxFit.cover)),
    child: Center(
      child: RaisedButton(
        child: Text(
          'Slide A',
          style: TextStyle(color: Colors.red),
        ),
        color: Colors.white,
        onPressed: () {
          Fluttertoast.showToast(
              msg: 'Clicked to Slide A',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        },
      ),
    ),
  );
}

_slideB() {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('https://i.imgur.com/gAumC4V.jpg'),
            fit: BoxFit.cover)),
    child: Center(
      child: RaisedButton(
        child: Text(
          'Slide B',
          style: TextStyle(color: Colors.yellow),
        ),
        color: Colors.white,
        onPressed: () {
          Fluttertoast.showToast(
              msg: 'Clicked to Slide B',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.yellow,
              textColor: Colors.white,
              fontSize: 16.0);
        },
      ),
    ),
  );
}

_slideC() {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('https://i.imgur.com/n7g3Naf.jpg'),
            fit: BoxFit.cover)),
    child: Center(
      child: RaisedButton(
        child: Text(
          'Slide C',
          style: TextStyle(color: Colors.orange),
        ),
        color: Colors.white,
        onPressed: () {
          Fluttertoast.showToast(
              msg: 'Clicked to Slide C',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.orange,
              textColor: Colors.white,
              fontSize: 16.0);
        },
      ),
    ),
  );
}
