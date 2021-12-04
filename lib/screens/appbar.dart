import 'package:facebook_flutter/screens/groups.dart';
import 'package:facebook_flutter/screens/notifications.dart';
import 'package:facebook_flutter/screens/videos.dart';

import 'home/home.dart';
import 'package:flutter/material.dart';

double _iconSize=30;
class AppBarFaceBook extends StatefulWidget {

  Widget homeIcon(int turn)=>Icon(Icons.home,color: turn==0?Colors.blue:Colors.black87,size: _iconSize,);
  Widget groupIcon(int turn)=>Icon(Icons.people,color:turn==1?Colors.blue: Colors.black87,size: _iconSize,);
  Widget videosIcon(int turn)=>Icon(Icons.video_label,color:turn==2?Colors.blue:Colors.black87,size: _iconSize,);
  Widget marketIcon(int turn)=>Icon(Icons.apps,color:turn==3?Colors.blue: Colors.black87,size: _iconSize,);
  Widget notficationsIcon(int turn)=>Icon(Icons.notifications,color: turn==4?Colors.blue:Colors.black87,size: _iconSize,);
  Widget listIcon(int turn)=>Icon(Icons.view_headline,color:turn==5?Colors.blue: Colors.black87,size: _iconSize,);

  static late double appBarHight;
  @override
  _AppBarFaceBookState createState() => _AppBarFaceBookState();
}

class _AppBarFaceBookState extends State<AppBarFaceBook> {
  GlobalKey appBarKey=GlobalKey();
  int turn=0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {

      AppBarFaceBook.appBarHight=appBarKey.currentContext!.size!.height;
    });

  }

  @override
  Widget build(BuildContext context) {
    print("appbar ");
    print(MediaQuery.of(context).size.height);
    return DefaultTabController(

      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            key: appBarKey,
            bottom: TabBar(
              onTap: (indx){
                turn=indx;
                setState(() {});
              },
              tabs: [
                Tab(icon: widget.homeIcon(turn)),
                Tab(icon: widget.groupIcon(turn)),
                Tab(icon: widget.videosIcon(turn)),
                Tab(icon: widget.marketIcon(turn)),
                Tab(icon: widget.notficationsIcon(turn)),
                Tab(icon: widget.listIcon(turn)),
              ],
            ),
            backgroundColor: Colors.white,
            actions: [
              IconButton(icon: Icon(Icons.search,color: Colors.black87,),onPressed: (){},),
              IconButton(icon: Icon(Icons.mail,color: Colors.black87,),onPressed: (){})
            ],
            title: Container(
              child: Image.asset('images/home_facebook_logo.jpg', fit: BoxFit.fitWidth,),
              height: 80,
              color: Colors.black87,
            ),
          ),
        ),
        body:TabBarView(
          children: [
            Home(),
            GroupsUI(),
            VideosUI(),
            Container(),
            NotificationFaceBook(),
            Container(),
        ],) ,
      ),
    );
  }
}
