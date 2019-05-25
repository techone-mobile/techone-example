import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:techone/blocs/FlashDealBloc.dart';
import '../../models/FlashDealModel.dart';

class FlashDeals extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFlashDealsState();
  }
}

class _MyFlashDealsState extends State<FlashDeals> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flashDealBlock.getAllFlashDeal();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(
      stream: flashDealBlock.stream(),
      builder: (context, snapshot) {
        if (!snapshot.hasError) {
          if (snapshot.hasData) {
            List<FlashDealModel> data = snapshot.data;
            return Column(
              children: <Widget>[
                Row(
                  /*Start H*/
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                        child: Text(
                          'FLASH DEALS',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
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
                          margin: EdgeInsets.only(right: 10, bottom: 10, top: 10),
                          child: Text(
                            'More',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.red),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 220,
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Fluttertoast.showToast(
                              msg: 'Clicked to ' + data[index].name,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.black87,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        child: items(data, index),
                      );
                    },
                  ),
                )
              ],
            );
          }
        }
        return Text('');
      },
    );
  }
}

items(List<FlashDealModel> data, int index) {
  return Container(
    width: 130,
    height: 220,
    margin: EdgeInsets.all(5),
    child: Column(
      /*Center H*/
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 120,
          height: 120,
          margin: EdgeInsets.all(4),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: Image.network(
                  data[index].thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                /*End H*/
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(3),
                    child: Text(
                      '50%',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 30,
          child: Center(
            child: Text(
              data[index].name,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis /*Make ...*/,
            ),
          ),
        ),
        Container(
            child: Center(
              child: Text(
                data[index].oldMoney.toString() + '(VNĐ)',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black54,
                  decoration: TextDecoration.lineThrough,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )),
        Container(
            height: 20,
            child: Center(
              child: Text(
                data[index].saleMoney.toString() + ' (VNĐ)',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ))
      ],
    ),
  );
}