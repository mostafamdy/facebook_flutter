import 'package:facebook_flutter/0model/comment.dart';
import 'package:facebook_flutter/0model/reaction.dart';

class PostData {
  String time = "0m";
  String groupName = "";
  String groupLink = "";
  PostPrievecy prievcy = PostPrievecy.public;
  String ownerName = "";
  String ownerImage = "";
  bool isGroup = false;
  String caption = "";
  bool haveImage = false;
  int mediaCount = 0;
  List<String> images = [];
  bool haveVideo = false;
  List<String> videos = [];
  ReactionsData reactions = ReactionsData();
  int commentCount=0;
  List<CommentData> comments=[];

  PostData({
    required this.comments,
    required this.time, required this.groupName, required this.groupLink, required this.prievcy,
    required this.ownerName, required this.ownerImage, required this.isGroup, required this.caption,
    required this.haveImage, required this.mediaCount, required this.images, required this.haveVideo, required this.videos,
    required this.reactions, required this.commentCount,
  });

  PostData.fromJson(Map<String, dynamic>  json){
         time=json['time'] ;
         groupName=json['groupName'];
         groupLink=json['groupLink'];
         prievcy= json['prievcy'] as PostPrievecy;
         ownerName=json['ownerName'];
         ownerImage=json['ownerImage'] ;
         isGroup=json['isGroup']as bool;
         caption=json['caption'];
         haveImage=json['haveImage'] as bool;
         mediaCount=json['mediaCount'] as int;
         images=json['images'];
         haveVideo=json['haveVideo'] as bool;
         videos=json['videos'] as List<String>;
         reactions= json['reactions'] as ReactionsData;
         commentCount=json['commentCount'] as int;
         comments=json['comments'] as List<CommentData>;
  }


  String toJson(){
    return 'PostData{time: $time, groupName: $groupName, groupLink: $groupLink, prievcy: $prievcy, ownerName: $ownerName, ownerImage: $ownerImage, isGroup: $isGroup, caption: $caption, haveImage: $haveImage, mediaCount: $mediaCount, images: $images, haveVideo: $haveVideo, videos: $videos, reactions: $reactions, commentCount: $commentCount}';
  }

  @override
  String toString() {
    return 'PostData{time: $time, groupName: $groupName, groupLink: $groupLink, prievcy: $prievcy, ownerName: $ownerName, ownerImage: $ownerImage, isGroup: $isGroup, caption: $caption, haveImage: $haveImage, mediaCount: $mediaCount, images: $images, haveVideo: $haveVideo, videos: $videos, reactions: $reactions, commentCount: $commentCount}';
  }

}

enum PostPrievecy { group, public, private }

