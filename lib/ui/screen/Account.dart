import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AccountUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAccountUIState();
  }
}

class _MyAccountUIState extends State<AccountUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(''),
      ),*/
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: Center(),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://avatars0.githubusercontent.com/u/18674411?s=460&v=4'),
                          fit: BoxFit.contain)),
                  child: Center(),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Nguyen Minh Duc',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: InkWell(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: 'Clicked to Logout',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.black87,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, bottom: 5, right: 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.settings,
                              color: Colors.black54,
                            ),
                          ),
                          Expanded(
                              flex: 10,
                              child: InkWell(
                                onTap: () {
                                  Fluttertoast.showToast(
                                      msg: 'Clicked to Settings',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIos: 1,
                                      backgroundColor: Colors.black87,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                },
                                child: Text(
                                  'Setting',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, bottom: 5, right: 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.info,
                              color: Colors.black54,
                            ),
                          ),
                          Expanded(
                              flex: 10,
                              child: InkWell(
                                onTap: () {
                                  Fluttertoast.showToast(
                                      msg: 'Clicked to About',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIos: 1,
                                      backgroundColor: Colors.black87,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                },
                                child: Text(
                                  'About',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, bottom: 5, right: 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.help,
                              color: Colors.black54,
                            ),
                          ),
                          Expanded(
                              flex: 10,
                              child: InkWell(
                                onTap: () {
                                  Fluttertoast.showToast(
                                      msg: 'Clicked to Helps',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIos: 1,
                                      backgroundColor: Colors.black87,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                },
                                child: Text(
                                  'Helps',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
