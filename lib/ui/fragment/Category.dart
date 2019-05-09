import 'package:flutter/material.dart';
import '../../values/Values.dart';
import 'package:fluttertoast/fluttertoast.dart';

Category() {
  return _girdView();
}

_girdView() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(5),
    child: Center(
      child: GridView.builder(
          itemCount: Values.categoryNames.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(5),
              color: Colors.white,
              child: Column(
                /*Make center H & V*/
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Values.categoryIcons[index]),
                  Text(Values.categoryNames[index],
                    style: TextStyle(
                        fontSize: 11,
                    ),
                  textAlign: TextAlign.center,)
                ],
              ),
            );
          }),
    ),
  );
}
