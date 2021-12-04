import 'package:facebook_flutter/0model/comment.dart';
import 'package:facebook_flutter/0view/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ReplyUI extends StatefulWidget {
  Comment currentComment;
  ReplyUI(this.currentComment,);
  @override
  _ReplyUIState createState() => _ReplyUIState();
}

class _ReplyUIState extends State<ReplyUI> {

  @override
  Widget build(BuildContext context) {
    List<CommentData>replies=widget.currentComment.comment.replies;
    print(replies.length);
    return ListView.builder(
        itemCount: replies.length+1,
        itemBuilder: (cntx,indx){
          if(indx==0){
            return widget.currentComment;
          }
          return Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 5),
            child: Comment(comment:replies[indx-1],)..isReply=true,
          );
        });
  }
}
