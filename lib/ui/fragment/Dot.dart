import 'package:flutter/material.dart';
import '../style/AppColor.dart';

class Dots {
 static dot(Color color) {
    return Container(
        width: 5,
        height: 5,
        margin: EdgeInsets.only(left: 2, right: 2, top: 5),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Center());
  }
}
