import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:techone/blocs/SearchBLoc.dart';
import 'package:techone/models/SearchHistoryModel.dart';
import 'package:techone/models/SearchPreviewModel.dart';

class SearchUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MySearchState();
  }
}

class _MySearchState extends State<SearchUI> {
  static int nonSearch = 0;
  static int inSearch = 1;
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Widget> UI;
  Widget nonSearchUI;
  Widget inSearchUI;
  int UIselected = nonSearch;
  TextField _appBarTitle;

  switchUI(String text) {
    if (_textEditingController.text.trim() != "") {
      setState(() {
        this.UIselected = inSearch;
        searchBloc.loadPreview(text);
      });
    } else {
      setState(() {
        this.UIselected = nonSearch;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nonSearchUI = Column(
      children: <Widget>[
        Expanded(
            flex: 4,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(5),
                        child: Text(
                          'Search history',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 5),
                    child: StreamBuilder(
                        stream: searchBloc.searchHistoryStream(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasError) {
                            if (snapshot.hasData) {
                              List<SearchHistoryModel> data = snapshot.data;
                              return ListView.separated(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        Fluttertoast.showToast(
                                            msg: 'Clicked to ' +
                                                data[index].keyword,
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIos: 1,
                                            backgroundColor: Colors.black87,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 5,
                                            left: 10,
                                            right: 5,
                                            bottom: 5),
                                        child: Text(
                                          data[index].keyword,
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ));
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider(
                                    color: Colors.black87,
                                  );
                                },
                              );
                            } else {
                              print('No search history data');
                            }
                          } else {
                            print(snapshot.error);
                          }
                          return Text('Loading');
                        }),
                  ),
                )
              ],
            )),
        Expanded(
          flex: 0,
          child: Container(
            color: Colors.white,
            child: Center(
              child: Text(''),
            ),
          ),
        ),
      ],
    );

    inSearchUI = StreamBuilder(
        stream: searchBloc.searchPreviewStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.hasData) {
              List<SearchPreviewModel> data = snapshot.data;

              if (data.isEmpty) {
                return Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'No result',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: 'Clicked to ' +
                                  data[index].keyword,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.black87,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                          child: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 5, right: 5, bottom: 5),
                                child: Text(
                                  data[index].keyword,
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                            )
                          ],
                        ),
                      ));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.black87,
                      );
                    },
                    itemCount: data.length);
              }
            } else {
              print('No data for search preview');
              return Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'No result',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              );
            }
          } else {
            print(snapshot.error);
            return Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Error',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            );
          }
        });

    UI = [nonSearchUI, inSearchUI];

    _appBarTitle = TextField(
        controller: _textEditingController,
        focusNode: _focusNode,
        autofocus: true,
        onChanged: (text) {
          switchUI(text);
        },
        textInputAction: TextInputAction.done,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: Colors.white,
        cursorRadius: Radius.circular(16),
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            /*prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),*/
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  _textEditingController.clear();
                  switchUI(_textEditingController.text);
                }),
            hintText: 'Search...',
            hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18)));
  }

  @override
  Widget build(BuildContext context) {
    searchBloc.loadHistory();

    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: _appBarTitle,
          automaticallyImplyLeading: true /*Show/Hidden arrow back*/,
        ),
        body: UI[UIselected]);
  }
}
