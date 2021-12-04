import 'package:facebook_flutter/0model/reaction.dart';

class CommentData {
  String? name;
  String? ownerImage;
  String? txt;
  String? image;
  String? video;
  bool? haveImage;
  bool? haveVideo;
  List<CommentData> replies=[];
  ReactionsData reactions=ReactionsData();
  String time="";
  CommentData({this.name, this.ownerImage, this.txt, this.image, this.video,
      this.haveImage, this.haveVideo, required this.replies, required this.reactions, required this.time});

}