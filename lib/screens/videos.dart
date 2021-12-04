import 'package:facebook_flutter/0model/comment.dart';
import 'package:facebook_flutter/0model/post.dart';
import 'package:facebook_flutter/0model/reaction.dart';
import 'package:facebook_flutter/0view/post.dart';
import 'package:flutter/material.dart';

class VideosUI extends StatefulWidget {
  @override
  _VideosUIState createState() => _VideosUIState();
}

class _VideosUIState extends State<VideosUI> {
  List<PostData> posts = [];
  String type="For you";
  void getPosts() {
    // select post where isGroup= true
    PostData post1 = PostData(
        comments: [
          CommentData(
              replies: [
                CommentData(
                    replies: [],
                    reactions: ReactionsData(),
                    time: "",
                    ownerImage: "images/profile.jpg",
                    haveVideo: false,
                    haveImage: true,
                    name: "comment name",
                    txt: "reply",
                    image: "images/profile.jpg"),
              ],
              reactions: ReactionsData(),
              time: "",
              ownerImage: "images/profile.jpg",
              haveVideo: false,
              haveImage: true,
              name: "comment name",
              txt: "comment",
              image: "images/profile.jpg"),
          CommentData(
              replies: [],
              reactions: ReactionsData(),
              time: "10w",
              ownerImage: "images/profile.jpg",
              haveVideo: false,
              haveImage: false,
              name: "comment name",
              txt: "comment"),
          CommentData(
              replies: [],
              reactions: ReactionsData(),
              time: "5h",
              ownerImage: "images/profile.jpg",
              haveVideo: false,
              haveImage: false,
              name: "comment name",
              txt: "comment"),
        ],
        caption: " ",
        commentCount: 4,
        groupLink: "link",
        groupName: "group name 1 ",
        haveImage: false,
        haveVideo: true,
        images: [],
        isGroup: true,
        mediaCount: 1,
        ownerImage: "images/profile.jpg",
        ownerName: "mostafa 1 ",
        prievcy: PostPrievecy.public,
        reactions: ReactionsData()
          ..count = 5
          ..countLike = 5,
        time: "5m",
        videos: ['https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4']);
    PostData post2 = PostData(
        comments: [],

        caption:
            "caption 200000000000000000000000000000000000000000000000000000000000000000000000000000000"
            "000000000000000000000000000000000000000000000000000"
            "0000000000000000000000000"
            "00000000000000000000000000"
            "0000000000000000000000000"
            "000000000000000000000000000"
            "000000000000000000000000000"
            "000000000000000000000000000"
            "000000000000000000000000000"
            "000000000000000000000000000"
            "000000000000000000000000"
            "000000000000000000000000"
            "000000000000000000000000000"
            "00000000000000000000000000000000000000000000"
            "00000000000000000000000000000000000000000000"
            "00000000000000000000000000000000000000000000"
            "00000000000000000000000000000000000000000000"
            "00000000000000000000000000000000000000000000"
            "00000000000000000000000000000000000000000000"
            "00000000000000000000000500000050000end",
        commentCount: 0,
        groupLink: "link",
        groupName: "group name 2 ",
        haveImage: false,
        haveVideo: true,
        images: [],
        isGroup: true,
        mediaCount: 1,
        ownerImage: "images/profile.jpg",
        ownerName: "mostafa 2 ",
        prievcy: PostPrievecy.private,
        reactions: ReactionsData(),
        time: "5m",
        videos: ['https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4']);
    PostData post3 = PostData(
        comments: [],
        caption: "",
        commentCount: 0,
        groupLink: "link",
        groupName: "group name 3 ",
        haveImage: false,
        haveVideo: true,
        images: [],
        isGroup: true,
        mediaCount: 1,
        ownerImage: "images/profile.jpg",
        ownerName: "mostafa 3 ",
        prievcy: PostPrievecy.group,
        reactions: ReactionsData(),
        time: "5m",
        videos: ['https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4']);
    PostData post4 = PostData(
        comments: [],
        caption:
            "200000000000000000000000000000000000000000000000000000000000000000000000000000000"
            "000000000000000000000000000000000000000000000000000"
            "0000000000000000000000000"
            "00000000000000000000000000"
            "0000000000000000000000000"
            "000000000000000000000000000"
            "000000000000000000000000000"
            "000000000000000000000000000"
            "000000000000000000000000000"
            "000000000000000000000000000"
            "000000000000000000000000"
            "000000000000000000000000"
            "000000000000000000000000000"
            "00000000000000000000000000000000000000000000"
            "00000000000000000000000000000000000000000000"
            "00000000000000000000000000000000000000000000"
            "00000000000000000000000000000000000000000000"
            "00000000000000000000000000000000000000000000"
            "00000000000000000000000000000000000000000000"
            "00000000000000000000000500000050000end",
        commentCount: 0,
        groupLink: "link",
        groupName: "group name 4 ",
        haveImage: false,
        haveVideo: true,
        images: ['images/profile.jpg'],
        isGroup: true,
        mediaCount: 1,
        ownerImage: "images/profile.jpg",
        ownerName: "mostafa 4 ",
        prievcy: PostPrievecy.public,
        reactions: ReactionsData(),
        time: "5m",
        videos: ['https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4']);
    posts.add(post1);
    posts.add(post2);
    posts.add(post3);
    posts.add(post4);
    print("posts is ready");
    setState(() {});
  }

  Widget videoType(String t) {
    return Padding(
      padding: const EdgeInsets.only(bottom:12.0),
      child: TextButton(
          onPressed: () {
            setState(() {
              type=t;
            });
          },
          child: Container(
            width: 70,
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: type==t?Colors.lightBlueAccent:Colors.transparent),
              child: Center(child: Text(t,style: TextStyle(color: type==t?Colors.white:Colors.black),)))
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      return getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: ListView.builder(
          itemCount: posts.length + 1,
          itemBuilder: (c, n) {
            if (n == 0) {
              return Container(
                color: Colors.white,
                height: 112,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Watch",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(width: 30,height: 30,decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(50)),child: Icon(Icons.account_circle)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(width: 30,height: 30,decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(50)),child: Icon(Icons.search)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: videoType("For you"),
                          ),
                          videoType("Live"),
                          videoType("Gaming"),
                          videoType("Following"),
                          videoType("Saved"),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(
                padding: EdgeInsets.only(top: 10), child: Post(posts[n - 1]));
          }),
    );
  }
}
