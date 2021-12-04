import 'package:facebook_flutter/0model/comment.dart';
import 'package:facebook_flutter/0model/post.dart';
import 'package:facebook_flutter/0model/reaction.dart';
import 'package:facebook_flutter/0view/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    _HomeState homestate = _HomeState();
    return homestate;
  }
}

class _HomeState extends State<Home> {
  Widget stroies = Container(
    margin: EdgeInsets.only(top: 10),
    height: 300,
    child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 12),
          height: 280,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 50,
              itemBuilder: (cntxt, indx) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          'images/profile.jpg',
                          width: 200,
                          height: 280,
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            child: Image.asset(
                              'images/profile.jpg',
                              width: 50,
                              height: 50,
                            ),
                            borderRadius: BorderRadius.circular(250)),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    ),
  );
  Widget activeUsers = Container(
    height: 90,
    margin: EdgeInsets.only(top: 8),
    child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            child: Text(
              "Audio and Video Rooms",
              style: TextStyle(fontSize: 15),
            ),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 8.0, top: 10, left: 10),
          ),
          Center(
            child: Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (c, indx) {
                    if (indx == 0) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          child: Container(
                            margin: EdgeInsets.only(right: 10, left: 10),
                            alignment: Alignment.center,
                            child: Text(
                              "Create Room",
                            ),
                          ),
                          onPressed: () {},
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.black12),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        ClipRRect(
                          child: Image.asset(
                            'images/profile.jpg',
                            width: 50,
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(250),
                        ),
                        CircleAvatar(backgroundColor: Colors.green, radius: 8)
                      ]),
                    );
                  }),
            ),
          ),
        ],
      ),
    ),
  );

  List<PostData> posts = [];
  bool postsReady=false;
  void getPosts() {
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
  }

  @override
  Widget build(BuildContext context) {
    Widget addingPost = Container(
      height: 115,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            // whats in your mind
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //ClipRRect(child: Image.asset('images/profile.jpg'),borderRadius: BorderRadius.circular(50)),
                CircleAvatar(
                  backgroundImage: AssetImage('images/profile.jpg'),
                  radius: 20,
                  backgroundColor: Colors.blue,
                ),
                TextButton(
                  child: Container(
                    child: Text(
                      "What's on your mind?",
                      style: TextStyle(color: Colors.black),
                    ),
                    width: MediaQuery.of(context).size.width / 1.2,
                    padding: EdgeInsets.only(left: 10),
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black38, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.black38,
            ),
            // add live or photo or video
            Container(
              height: 40,
              child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3 - 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/profile.jpg',
                            width: 20,
                          ),
                          Text("  Live")
                        ],
                      ),
                    ),
                  ),
//                Text("|"),
                  VerticalDivider(),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3 - 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/profile.jpg',
                            width: 20,
                          ),
                          Text("  photo")
                        ],
                      ),
                    ),
                  ),
//                Text("|"),
                  VerticalDivider(),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3 - 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/profile.jpg',
                            width: 20,
                          ),
                          Text("  video")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    if(!postsReady) {
      getPosts();
      postsReady=true;
      setState(() {});
    }
    return Scaffold(
      backgroundColor: Colors.black38,
      body: ListView.builder(
          itemCount: posts.length+3,
          itemBuilder: (conext, indx) {
            if (indx == 0) {
              return addingPost;
            } else if (indx == 1) {
              return activeUsers;
            } else if (indx == 2) {
              return stroies;
            }
            return Container(
                padding: EdgeInsets.only(top: 10), child: Post(posts[indx-3]));
          }),
    );
  }
}
