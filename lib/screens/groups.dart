import 'package:facebook_flutter/0model/comment.dart';
import 'package:facebook_flutter/0model/post.dart';
import 'package:facebook_flutter/0model/reaction.dart';
import 'package:facebook_flutter/0view/post.dart';
import 'package:facebook_flutter/screens/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupsUI extends StatefulWidget {
  @override
  _GroupsUIState createState() => _GroupsUIState();
}

class _GroupsUIState extends State<GroupsUI> {
//  int groupsBarCount=5;
  List<PostData> posts=[];
  List<Group> groups=[];
  void getPosts() {
    // select post where isGroup= true
    PostData post1= PostData(
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
                    image: "images/profile.jpg"
                ),

              ],
              reactions: ReactionsData(),
              time: "",
              ownerImage: "images/profile.jpg",
              haveVideo: false,
              haveImage: true,
              name: "comment name",
              txt: "comment",
              image: "images/profile.jpg"
          ),

          CommentData(
              replies: [],
              reactions: ReactionsData(),
              time: "10w",
              ownerImage: "images/profile.jpg",
              haveVideo: false,
              haveImage: false,
              name: "comment name",
              txt: "comment"
          ),

          CommentData(
              replies: [],
              reactions: ReactionsData(),
              time: "5h",
              ownerImage: "images/profile.jpg",
              haveVideo: false,
              haveImage: false,
              name: "comment name",
              txt: "comment"
          ),
        ],
        caption: " ",
        commentCount:4 ,
        groupLink: "link",
        groupName: "group name 1 ",
        haveImage: true,
        haveVideo: false,
        images: ["images/profile.jpg"],
        isGroup: true,
        mediaCount: 1,
        ownerImage: "images/profile.jpg",
        ownerName: "mostafa 1 ",
        prievcy: PostPrievecy.public,
        reactions: ReactionsData()..count=5..countLike=5,
        time: "5m",
        videos: []
    );
    PostData post2= PostData(
        comments: [],
        caption: "caption 200000000000000000000000000000000000000000000000000000000000000000000000000000000"
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
        haveVideo: false,
        images: [],
        isGroup: true,
        mediaCount: 0,
        ownerImage: "images/profile.jpg",
        ownerName: "mostafa 2 ",
        prievcy: PostPrievecy.private,
        reactions: ReactionsData(),
        time: "5m",
        videos: []
    );
    PostData post3= PostData(
        comments: [],
        caption: "",
        commentCount: 0,
        groupLink: "link",
        groupName: "group name 3 ",
        haveImage: false,
        haveVideo: false,
        images: [],
        isGroup: true,
        mediaCount: 0,
        ownerImage: "images/profile.jpg",
        ownerName: "mostafa 3 ",
        prievcy: PostPrievecy.group,
        reactions: ReactionsData(),
        time: "5m",
        videos: []
    );
    PostData post4= PostData(
        comments: [],
        caption: "200000000000000000000000000000000000000000000000000000000000000000000000000000000"
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
        haveImage: true,
        haveVideo: false,
        images: ['images/profile.jpg'],
        isGroup: true,
        mediaCount: 1,
        ownerImage: "images/profile.jpg",
        ownerName: "mostafa 4 ",
        prievcy: PostPrievecy.public,
        reactions: ReactionsData(),
        time: "5m",
        videos: []
    );
    posts.add(post1);
    posts.add(post2);
    posts.add(post3);
    posts.add(post4);
    print("posts is ready");
    getGroups();
    setState(() {});
  }

  void getGroups(){
    Group g1=Group(link: "link", image: "images/profile.jpg", name: "group name 1");
    Group g2=Group(link: "link", image: "images/profile.jpg", name: "group name 2");
    Group g3=Group(link: "link", image: "images/profile.jpg", name: "group name 3");
    Group g4=Group(link: "link", image: "images/profile.jpg", name: "group name 4");
    Group g5=Group(link: "link", image: "images/profile.jpg", name: "group name 5");
    groups.add(g1);
    groups.add(g2);
    groups.add(g3);
    groups.add(g4);
    groups.add(g5);

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
    print("AppBar h = ${AppBarFaceBook.appBarHight}");
    return Scaffold(
      backgroundColor: Colors.black38,
      body: ListView.builder(
          itemCount: posts.length+1,
          itemBuilder: (conext, indx) {
            if (indx==0){
              return Container(
                color: Colors.white,
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: groups.length,
                      itemBuilder: (c,indx){
                        return Padding(
                          padding: const EdgeInsets.only(top: 12.0,left: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(30))),
                            child: Stack(
                              children: [
                                Container(
                                  height: 170,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(18)),
                                    child: Image.asset(
                                      groups[indx].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(padding: EdgeInsets.only(bottom: 18,left: 15),alignment: Alignment.bottomCenter,child: Text(groups[indx].name,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),))
                              ],
                            ),
                          ),
                        );
                      },
                  ),
              );
            }
            return Container(
                padding: EdgeInsets.only(top: 10), child: Post(posts[indx-1]));
          }),
    );
  }
}
class Group{
  String link;
  String image;
  String name;
  Group({required this.link, required this.image, required this.name});
}