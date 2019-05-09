import 'package:flutter/material.dart';
import '../../values/Values.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../style/AppColor.dart';

category() {
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
            return InkWell(
              onTap: () {
                Fluttertoast.showToast(
                    msg: 'Clicked to ' + Values.categoryNames[index],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.black87,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Container(
                margin: EdgeInsets.all(5),
                color: Colors.white,
                child: Column(
                  /*Make center H & V*/
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  /**/
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 4),
                      child: Icon(Values.categoryIcons[index],
                          color: AppColor.primaryColor),
                    ),
                    Container(
                      child: Text(
                        Values.categoryNames[index],
                        style: TextStyle(fontSize: 11, color: Colors.redAccent),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    ),
  );
}
