import 'package:facebook_flutter/0model/comment.dart';
import 'package:facebook_flutter/0view/post.dart';
import 'package:facebook_flutter/0model/reaction.dart';
import 'package:facebook_flutter/0view/reply.dart';
import 'package:flutter/material.dart';

// comments view contains list of comment view
class CommentUI extends StatefulWidget {
  List<CommentData>comments;
  CommentUI(this.comments);
  @override
  _CommentUIState createState() => _CommentUIState();
}

class _CommentUIState extends State<CommentUI> {

  double h=0;
  static bool showReply=false;
  static Comment? comment;

  @override
  void dispose() {
    print("disposed");
    showReply=false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int postReactionsCount=35;
    return Column(
      children: [
        AnimatedContainer(duration: Duration(milliseconds: 500),height: h,color: Colors.transparent,),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: Colors.white,
          height: MediaQuery.of(context).size.height-h,
          child: Column(
            children: [
              GestureDetector(
                onVerticalDragUpdate: (d){
                  print("update");
                  h=d.globalPosition.dy;
                  print("context h"+MediaQuery.of(context).size.height.toString());
                  print("h= "+h.toString());
                  setState(() {});
                  print("__________________________________");
                },
                onVerticalDragEnd: (d){print("end");
                if (h>200){
                  print("poped");
                  h=MediaQuery.of(context).size.height-100;
                  setState(() {});
                  Navigator.pop(context);

                }
                else{
                  h=0;
                  setState(() {});
                }
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(Icons.favorite_border,color: Colors.blueAccent,),
                        Text(" ${postReactionsCount}",style: TextStyle(fontSize: 12,color: Colors.black38,decoration: TextDecoration.none)),
                        Icon(Icons.navigate_next),
                          ],),
                      Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(onPressed: (){}, child: Icon(Icons.favorite_border)))
                    ],
                  ),
                ),
              ),
              Divider(),
              showReply?
              Expanded(child: ReplyUI(comment!)):
              Expanded(
                child: ListView.builder(
                    itemCount: widget.comments.length,
                    itemBuilder: (cnxt,indx){
                      return Comment(updateParent: (var v){setState(() {});},comment: widget.comments[indx],);
                    }),
              ),
            ],
          ),
        ),
    ],);
      }
  }


class Comment extends StatefulWidget {
  bool isReply=false;
  ValueChanged? updateParent;
  CommentData comment;

  Comment({Key? key, this.updateParent,required this.comment}) : super(key: key);
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {

  GlobalKey rectKey=GlobalKey();
  GlobalKey comntKey=GlobalKey();

  bool reactVisibility = false;
  bool reactAnimationEnded = false;
  bool reactEnabled = false;
  double? startX = 0;
  double? startY = 0;

  void setXY(BuildContext context) {
    RenderBox reactBox =
    rectKey.currentContext!.findRenderObject() as RenderBox;
    Offset reactPosition = reactBox.localToGlobal(Offset.zero);
    RenderBox postBox = comntKey.currentContext!.findRenderObject() as RenderBox;
    Offset postPosition = postBox.localToGlobal(Offset.zero);
    startX = reactPosition.dx - postPosition.dx;
    startY = reactPosition.dy - postPosition.dy;
    setState(() {});
  }




  void setCommentData() {
//    comment.name = "mostafa hamdy";
//    comment.haveImage = false;
//    comment.ownerImage = "images/profile.jpg";
//    comment.txt = "My bro";
//    comment.reactions.myReaction = Reaction.none;
//    comment.reactions.count = 5;
//    comment.time="45m";
  }

  bool commentsIsReady=false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      return setXY(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    if(!commentsIsReady){
      setCommentData();
      commentsIsReady=true;
    }

    Widget reactionButton = Container(
      child: TextButton(
        onPressed: () {
          if (widget.comment.reactions.myReaction == Reaction.none) {
            widget.comment.reactions.myReaction = Reaction.like;
            widget.comment.reactions.count=widget.comment.reactions.count+1;
            print("in if");
          }
          else {
            widget.comment.reactions.myReaction = Reaction.none;
            widget.comment.reactions.count=widget.comment.reactions.count-1;
            print("count decres"+widget.comment.reactions.count.toString());
          }
          setState(() {
            print("pressed "+widget.comment.reactions.count.toString());
          });
        },
        onLongPress: () {
          RenderBox reactBox =
          rectKey.currentContext!.findRenderObject() as RenderBox;
          Offset reactPosition = reactBox.localToGlobal(Offset.zero);
          RenderBox comntBox =
          comntKey.currentContext!.findRenderObject() as RenderBox;
          Offset postPosition = comntBox.localToGlobal(Offset.zero);
          if (reactEnabled) {
            print("B start x " + startX.toString());
            print("B start y " + startY.toString());

            setState(() {
              startX = reactPosition.dx - postPosition.dx;
              startY = reactPosition.dy - postPosition.dy-50;
              print("F start x " + startX.toString());
              print("F start y " + startY.toString());
              reactAnimationEnded = true;
              reactEnabled=false;
              reactVisibility=false;
            });
          } else {
            setState(() {
              print("true");
              startX = reactPosition.dx - postPosition.dx + 75;
              startY = reactPosition.dy - postPosition.dy - 50;
              reactVisibility = true;
              reactAnimationEnded = false;
            });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.comment.reactions.count} Like",
              key: rectKey,
            ),
          ],
        ),
      ),
    );
    Widget commentButton = Container(
      child: TextButton(
        onPressed: () {
          _CommentUIState.comment=this.widget;
          _CommentUIState.showReply=true;
          widget.updateParent!.call(5);
//          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
//              ReplyUI(this.widget)));
        },
        child: Text("${widget.comment.replies.length} reply"),
      ),
    );
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

    return Material(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: ListTile(
              key: comntKey,
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(widget.comment.ownerImage??"")
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Colors.black12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.comment.name??"",style: TextStyle(fontWeight:FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0,bottom: 5),
                          child: Column(
                            children: [
                              Text(widget.comment.txt??""),
                              if(widget.comment.haveImage==true) Image.asset(widget.comment.image??"")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${widget.comment.time}"),
                      reactionButton,
                      if (!widget.isReply)  commentButton
                    ],
                  )
                ],
              ),
            ),
          ),
          reactEnabled ? _reactBox : Container(),
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

