import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:techone/blocs/SuggestionsProductBloc.dart';
import 'package:techone/models/SuggestionsProductModel.dart';

class SuggestionsProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MySuggestionsProductState();
  }
}

class _MySuggestionsProductState extends State<SuggestionsProduct> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    suggestionsProductBloc.load();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(
      stream: suggestionsProductBloc.stream(),
      builder: (context, snapshot) {
        if (!snapshot.hasError) {
          if (snapshot.hasData) {
            List<SuggestionsProductModel> data = snapshot.data;
            return Column(
              children: <Widget>[
                Row(
                  /*Start H*/
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                        child: Text(
                          'SUGGESTIONS PRODUCT',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: 'Clicked to show more',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.black87,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        child: Container(
                          margin:
                              EdgeInsets.only(right: 10, bottom: 10, top: 10),
                          child: Text(
                            'More',
                            style: TextStyle(fontSize: 13, color: Colors.red),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: customGirdView(data),
                )
              ],
            );
          }
        }
        return Text('');
      },
    );
  }

  customGirdView(List<SuggestionsProductModel> data) {
    List<Widget> widgets = List<Widget>();

    for (int index = 0; index < data.length; index += 2) {
      List<Widget> widgetsChild = List<Widget>();

      widgetsChild.add(
        Expanded(
          child: InkWell(
            onTap: () {
              Fluttertoast.showToast(
                  msg: 'Clicked to ' + data[index].name,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.black87,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            child: Container(
              height: 200,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 130,
                        width: 200,
                        margin:
                            EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        child: Image.network(
                          data[index].thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text('')
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                    child: Text(
                      data[index].name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      data[index].money.toString() + ' (VNĐ)',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
      if (index + 1 < data.length) {
        widgetsChild.add(
          Expanded(
            child: InkWell(
              onTap: () {
                Fluttertoast.showToast(
                    msg: 'Clicked to ' + data[index + 1].name,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.black87,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Container(
                height: 200,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 130,
                          width: 200,
                          margin:
                              EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          child: Image.network(
                            data[index + 1].thumbnail,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text('')
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                      child: Text(
                        data[index + 1].name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        data[index + 1].money.toString() + ' (VNĐ)',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
      widgets.add(Row(
          mainAxisAlignment: MainAxisAlignment.center, children: widgetsChild));
    }

    return Column(
      children: widgets,
    );
  }
}
