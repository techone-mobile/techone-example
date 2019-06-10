import 'package:flutter/material.dart';
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
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    color: data[index].isRead ? Colors.white : Colors.black12,
                    margin: EdgeInsets.all(6),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.network(data[index].thumbnail),
                        ),
                        Container(
                          child: Text(
                            data[index].content,
                            style: TextStyle(color: Colors.black87),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: data.length);
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
