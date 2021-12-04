import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:facebook_flutter/main.dart';
import 'package:flutter/rendering.dart';
class Splash extends StatefulWidget {
  Color activeColor=MyApp.appColor;
  Color notActiveColor=Colors.black;
  int circlesCount=7;
  int splashTime=5;//time in second
  int loadingTime=500;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  List<bool> loadingActive=[];
  int turn=0;
  Widget loading_circle(bool isActive){
    print(isActive);
    print("____________________________________________________");
    return
      Container(child:CircleAvatar(
        backgroundColor:isActive?widget.activeColor:widget.notActiveColor,
        radius: 10,

      ) ,padding: EdgeInsets.only(left: 15),);
  }
  ListView loading(){
    Timer(
        Duration(milliseconds: widget.loadingTime),
            () {
          if(this.mounted){
            print("time");
            print(((widget.splashTime.toDouble()/widget.circlesCount.toDouble())/2.0)*1000);
            turn++;
            if (turn==widget.circlesCount){
              turn=0;
            }
            setState(() {});
          }
        }
    );
//    Future.delayed(Duration(milliseconds: 1000)).then((value) {
//      turn++;
//      if (turn==5){
//        turn=0;
//      }
//      setState(() {
//
//      });
//    });
    return ListView.builder(
      itemCount: widget.circlesCount,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,indx){
        if (indx==0){
          print("________________turn_____________");
          print("turn = "+turn.toString());
        }
        print(indx.toString());
        return loading_circle(indx==turn);
      },
    );
  }
  @override
  void initState() {
    loadingActive=List.generate(widget.circlesCount, (index) => false);
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: widget.splashTime),
            () {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              Login()), (Route<dynamic> route) => false);
        }
    );
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 50,
              ),
            ),
            Center(child: Container(child:loading(),height: 150,width:250),),
          ],)
    );
  }

}