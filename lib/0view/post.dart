import 'package:facebook_flutter/0model/post.dart';
import 'package:facebook_flutter/0view/comment.dart';
import 'package:facebook_flutter/0model/reaction.dart';
import 'package:facebook_flutter/VideoDriver.dart';
import 'package:facebook_flutter/screens/videos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  PostData postData;
  Post(this.postData);
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {

  double? startX = 0;
  double? startY = 0;
  double h=0;
  GlobalKey rectkey = GlobalKey();
  GlobalKey postKey = GlobalKey();
  GlobalKey captionKey=GlobalKey();
  GlobalKey buttonsKey=GlobalKey();
  GlobalKey ownerKey=GlobalKey();
  bool reactVisibility = false;
  bool reactAnimationEnded = false;
  bool reactEnabled = false;
  bool firstRenderDone=false;

  GlobalKey countKey=GlobalKey();

  void setXY(BuildContext context) {
    RenderBox reactBox =
        rectkey.currentContext!.findRenderObject() as RenderBox;
    Offset reactPosition = reactBox.localToGlobal(Offset.zero);
    RenderBox postBox = postKey.currentContext!.findRenderObject() as RenderBox;
    Offset postPosition = postBox.localToGlobal(Offset.zero);
    startX = reactPosition.dx - postPosition.dx;
    startY = reactPosition.dy - postPosition.dy;

    RenderBox captionRender=captionKey.currentContext!.findRenderObject() as RenderBox;
    RenderBox ownerRender=ownerKey.currentContext!.findRenderObject() as RenderBox;
    RenderBox countRender=countKey.currentContext!.findRenderObject() as RenderBox;
    RenderBox buttonsRender=buttonsKey.currentContext!.findRenderObject() as RenderBox;
    h=captionRender.size.height+ownerRender.size.height+countRender.size.height+buttonsRender.size.height;

    print("caption ${captionRender.size.height}");
    print("owner ${ownerRender.size.height}");
    print("count ${countRender.size.height}");
    print("button ${buttonsRender.size.height}");
    firstRenderDone=true;
    print("first render");
    print("h = $h");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      return setXY(context);
    });
  }

//  void setPostData(){
//  widget.postData.ownerImage = "images/profile.jpg";
//  widget.postData.ownerName = "mostafa hamdy";
//  widget.postData.isGroup = true;
//  widget.postData.groupName = "اسم المجموعه";
//  widget.postData.caption = "thies is post caption";
//  widget.postData.haveImage = true;
//  widget.postData.images = ["images/profile.jpg"];
//  widget.postData.mediaCount = 1;
//  widget.postData.reactions.count = 5;
//  widget.postData.reactions.countLike = 5;
//  widget.postData.commentCount = 10;
//}
  @override
  Widget build(BuildContext context) {

    //00 function for it 00//
    Widget _like  = AnimatedPositioned(
      onEnd: () {
        if (reactAnimationEnded) {
          setState(() {
            reactVisibility = false;
          });
        } 
        else if (reactVisibility) 
        {
          print("row");
          Future.delayed(Duration(milliseconds: 1000)).then((value) { setState(() {
            reactEnabled = true;
            reactVisibility=false;
          });} );

        }
      },
      duration: Duration(milliseconds: 50),
      top: startY,
      left: startX! - 150,
      child: Visibility(
        visible: reactVisibility,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.blue),
        ),
      ),
    );
    Widget _love  = AnimatedPositioned(
      duration: Duration(milliseconds: 200),
      top: startY,
      left: startX! - 100,
      child: Visibility(
        visible: reactVisibility,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.red),
        ),
      ),
    );
    Widget _care  = AnimatedPositioned(
      duration: Duration(milliseconds: 350),
      top: startY,
      left: startX! - 50,
      child: Visibility(
        visible: reactVisibility,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.pink),
        ),
      ),
    );
    Widget _haha  = AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: startY,
      left: startX,
      child: Visibility(
        visible: reactVisibility,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.amber),
        ),
      ),
    );
    Widget _wow   = AnimatedPositioned(
      duration: Duration(milliseconds: 600),
      top: startY,
      left: startX! + 50,
      child: Visibility(
        visible: reactVisibility,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.purple),
        ),
      ),
    );
    Widget _sad   = AnimatedPositioned(
      duration: Duration(milliseconds: 750),
      top: startY,
      left: startX! + 100,
      child: Visibility(
        visible: reactVisibility,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.amber),
        ),
      ),
    );
    Widget _angry = AnimatedPositioned(
      duration: Duration(milliseconds: 900),
      top: startY,
      left: startX! + 150,
      child: Visibility(
        visible: reactVisibility,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.amber),
        ),
      ),
    );
    //00
    Widget _reactBox = Positioned(
        top: startY,
        left: startX!-150,
        child: Visibility(
          visible: reactEnabled,
          child: Container(
            height: 50,
            width: 350,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white,border: Border.all(color: Colors.black,width: 3)),
            child: Stack(
              children: [
                Positioned(
                top: 0,
                left: 0,
                child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100), color: Colors.blue),
            ),
              ),
                Positioned(
                top: 0,
                left: 50,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100), color: Colors.red),
                ),
              ),
                Positioned(
                top: 0,
                left: 100,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100), color: Colors.pink),
                ),
              ),
                Positioned(
                top: 0,
                left: 150,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100), color: Colors.amber),
                ),
              ),
                Positioned(
                top: 0,
                left: 200,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100), color: Colors.purple),
                ),
              ),
                Positioned(
                top: 0,
                left: 250,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100), color: Colors.amber),
                ),
              ),
                Positioned(
                top: 0,
                left: 300,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100), color: Colors.amber),
                ),
              ),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Container(
//                    width: 30,
//                    height: 30,
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(100), color: Colors.blue),
//                  ),
//                ),Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Container(
//                    width: 30,
//                    height: 30,
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(100), color: Colors.blue),
//                  ),
//                ),Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Container(
//                    width: 30,
//                    height: 30,
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(100), color: Colors.blue),
//                  ),
//                ),Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Container(
//                    width: 30,
//                    height: 30,
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(100), color: Colors.blue),
//                  ),
//                ),
              ],
            ),
          ),
        ));
    Widget reactionButton = Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 3,
      child: TextButton(
        onPressed: () {
          if (widget.postData.reactions.myReaction == Reaction.none) {
            widget.postData.reactions.myReaction = Reaction.like;
            widget.postData.reactions.count=widget.postData.reactions.count+1;
          }
          else {
            widget.postData.reactions.myReaction = Reaction.none;
            widget.postData.reactions.count=widget.postData.reactions.count-1;
          }
          setState(() {
            print("pressed "+widget.postData.reactions.count.toString());
          });
        },
        onLongPress: () {
          RenderBox reactBox =
              rectkey.currentContext!.findRenderObject() as RenderBox;
          Offset reactPosition = reactBox.localToGlobal(Offset.zero);
          RenderBox postBox =
              postKey.currentContext!.findRenderObject() as RenderBox;
          Offset postPosition = postBox.localToGlobal(Offset.zero);
          if (reactEnabled) {
            print("B start x " + startX.toString());
            print("B start y " + startY.toString());

            setState(() {
              startX = reactPosition.dx - postPosition.dx;
              startY = reactPosition.dy - postPosition.dy;
              print("F start x " + startX.toString());
              print("F start y " + startY.toString());
              reactAnimationEnded = true;
              reactEnabled=false;
//                  reactVisibility=false;
            });
          } else {
            setState(() {
              print("true");
              startX = reactPosition.dx - postPosition.dx + 75;
              startY = reactPosition.dy - postPosition.dy - 75;
              reactVisibility = true;
              reactAnimationEnded = false;
            });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.postData.reactions.myReaction == Reaction.none
                ? Icon(Icons.favorite_border)
                : widget.postData.reactions.myReaction == Reaction.like
                    ? Icon(Icons.favorite)
                    : widget.postData.reactions.myReaction == Reaction.love
                        ? Icon(Icons.ac_unit)
                        : widget.postData.reactions.myReaction == Reaction.care
                            ? Icon(Icons.access_alarm)
                            : widget.postData.reactions.myReaction == Reaction.haha
                                ? Icon(Icons.account_circle)
                                : widget.postData.reactions.myReaction == Reaction.wow
                                    ? Icon(Icons.add)
                                    : widget.postData.reactions.myReaction ==
                                            Reaction.sad
                                        ? Icon(Icons.add_location)
                                        : Icon(Icons.zoom_out), // angry
            Text(
              "Like",
              key: rectkey,
            ),
          ],
        ),
      ),
    );
    Widget commentButton = Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 3,
      child: TextButton(
        onPressed: () {
//          widget.commentPressed=true;
//          setState(() {});
          Navigator.of(context).push(TransparentRoute(builder: (context) =>
              CommentUI(widget.postData.comments)));
//          Navigator.of(context).push(MaterialPageRoute(builder: (conxt)=>CommentUI()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.email), Text("comment")],
        ),
      ),
    );
    Widget shareButton = Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 3,
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.share), Text("share")],
        ),
      ),
    );
    if(firstRenderDone){
      RenderBox captionRender=captionKey.currentContext!.findRenderObject() as RenderBox;
      h=captionRender.size.height;
      print("h = $h");
    }
   return Container(
        key: postKey,
        height: widget.postData.mediaCount==0?(h)+178: h+500+178,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //owner's image name time group
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      key: ownerKey,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                widget.postData.ownerImage,
                                width: 50,
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(250),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.postData.ownerName),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(widget.postData.time + " "),
                                    widget.postData.prievcy == PostPrievecy.public
                                        ? Icon(
                                            Icons.public,
                                            size: 12,
                                          )
                                        : widget.postData.prievcy == PostPrievecy.group
                                            ? Icon(
                                                Icons.group,
                                                size: 12,
                                              )
                                            : Icon(
                                                Icons.alarm,
                                                size: 12,
                                              )
                                  ],
                                ),
                              ],
                            ),
                            widget.postData.isGroup
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 18.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.arrow_right),
                                        Text(widget.postData.groupName)
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.remove)),
                            IconButton(onPressed: () {}, icon: Icon(Icons.close))
                          ],
                        )
                      ],
                    ),
                  ),
                  // caption
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.postData.caption,key: captionKey,softWrap: true,overflow: TextOverflow.visible,),
                  ),
                  widget.postData.mediaCount > 0
                      ? widget.postData.haveImage
                          ? Image.asset(
                              widget.postData.images[0],
                              fit: BoxFit.fill,
                              height: 500,
                              width: MediaQuery.of(context).size.width,
                            )
                          : Container(child: VideoDriver(url: widget.postData.videos[0],),
//                              fit: BoxFit.fill,
                              height: 500,
                              width: MediaQuery.of(context).size.width,
                            )
                      : Container(height: 0,), // no media
                  // reactions count and comments count
                  Container(
                    height: 30,
                    child: Row(
                      key:countKey ,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 14, bottom: 8, right: 8, top: 8),
                          child: Row(
                            children: [
                              widget.postData.reactions.countLike > 0
                                  ? Icon(
                                      Icons.favorite,
                                    )
                                  : Container(),
                              widget.postData.reactions.countLove > 0
                                  ? Icon(Icons.ac_unit)
                                  : Container(),
                              widget.postData.reactions.countCare > 0
                                  ? Icon(Icons.access_alarm)
                                  : Container(),
                              widget.postData.reactions.countHaha > 0
                                  ? Icon(Icons.account_circle)
                                  : Container(),
                              widget.postData.reactions.countWow > 0
                                  ? Icon(Icons.wine_bar_sharp)
                                  : Container(),
                              widget.postData.reactions.countSad > 0
                                  ? Icon(Icons.add_location)
                                  : Container(),
                              widget.postData.reactions.countAngry > 0
                                  ? Icon(Icons.zoom_out)
                                  : Container(),
                              Text(widget.postData.reactions.count.toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.postData.commentCount.toString() + " comments  ",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  // reaction comment share
                  Row(
                    key: buttonsKey,
                    children: [reactionButton, commentButton, shareButton],
                  )
                ],
              ),
            ),
            reactEnabled ? _reactBox : Container(),
//            widget.commentPressed?CommentUI():Container(height: 0,width: 0,),
            _like,
            _love,
            _care,
            _haha,
            _wow,
            _sad,
            _angry,
          ],
        ),
      );
  }
}


class WhoReactUI extends StatefulWidget {
  @override
  _WhoReactUIState createState() => _WhoReactUIState();
}

class _WhoReactUIState extends State<WhoReactUI> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    required this.builder,
    RouteSettings? settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);
  double height=0;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return result;
//      GestureDetector(
//      child: Container(child: Padding(
//        padding:  EdgeInsets.only(top: height),
//        child: result,
//      ),
////        color: Colors.green,height: MediaQuery.of(context).size.height-height,
//      ),
////      onVerticalDragStart: (details){print("start "+details.globalPosition.dy.toString());},
////      onVerticalDragDown: (details){print("down "+details.globalPosition.dy.toString());},
////      onVerticalDragUpdate: (details){
////        print("update "+details.globalPosition.dy.toString());
////        setState(() {
////          height=details.globalPosition.dy;
////
////        });
////      },
////      onVerticalDragEnd: (details){print("end ");},
//    );


//      FadeTransition(
//      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
//      child: Semantics(
//        scopesRoute: true,
//        explicitChildNodes: true,
//        child: result,
//      ),
//    );
  }
}