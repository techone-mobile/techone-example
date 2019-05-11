import 'package:flutter/material.dart';
import 'package:techone/pages/PageAlert.dart';
import 'package:techone/pages/PageBlog.dart';
import 'package:techone/pages/PageHome.dart';
import 'package:techone/pages/PageProfile.dart';
import 'package:techone/pages/PageSub.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}
class HomeState extends State<Home> {
  int index=0;
  Widget callPage(){
    switch(index){
      case 0: return PageHome();
      case 1: return PageSub();
      case 2: return PageAlert();
      case 3: return PageBlog();
      case 4: return PageProfile();
      default : return PageHome();
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: callPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value){
          setState(() {
            index=value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home,color: Colors.red,),
            title: new Text("Home",style: new TextStyle(color: Colors.orange),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.pages,color: Colors.red,),
            title: new Text("Pages",style: new TextStyle(color: Colors.orange)),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.notifications,color: Colors.red,),
            title: new Text("Alert",style: new TextStyle(color: Colors.orange)),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.supervised_user_circle,color: Colors.red,),
            title: new Text("Blog",style: new TextStyle(color: Colors.orange)),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle,color: Colors.red,),
            title: new Text("Profile",style: new TextStyle(color: Colors.orange)),
          )
        ])
      ,
    );
  }
}