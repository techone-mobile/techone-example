import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:techone/blocs/NotificationBloc.dart';
import 'package:techone/models/NotificationModel.dart';

class NotificationUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyNotificationUIState();
  }
}

class _MyNotificationUIState extends State<NotificationUI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationBloc.load();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder(
          stream: notificationBloc.stream(),
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              if (snapshot.hasData) {
                print('Has Data');
                List<NotificationModel> data = snapshot.data;
                return Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: InkWell(
                                  onTap: () {
                                    Fluttertoast.showToast(
                                        msg: 'Clicked to Notification',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIos: 1,
                                        backgroundColor: Colors.black87,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  },
                                  child: Text('Notification',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: InkWell(
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: 'Clicked to Read All',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIos: 1,
                                          backgroundColor: Colors.black87,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    },
                                    child: Text('Make read all',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold))),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: (){
                                          Fluttertoast.showToast(
                                              msg: 'Clicked to' + data[index].content,
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIos: 1,
                                              backgroundColor: Colors.black87,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        },
                                        child: Container(
                                          color: data[index].isRead
                                              ? Colors.white
                                              : Colors.black12,
                                          margin: EdgeInsets.all(6),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: Image.network(
                                                    data[index].thumbnail),
                                              ),
                                              Container(
                                                child: Text(
                                                  data[index].content,
                                                  style: TextStyle(
                                                      color: Colors.black87),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: data.length)))
                      ],
                    ));
              } else {
                print('No data for notification');
                return Text('No data for notification');
              }
            } else {
              print(snapshot.error);
              return Text('Error');
            }
          },
        ));
  }
}
