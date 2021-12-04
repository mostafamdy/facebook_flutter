import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NotificationFaceBook extends StatefulWidget {
  @override
  _NotficationState createState() => _NotficationState();
}

class _NotficationState extends State<NotificationFaceBook> {
  List<NotificationModel> notifications=[];
  void getNots(){
    NotificationModel n1=NotificationModel(
        time:"5m",
        IsRead: false,
        link: "link",
        image: "images/profile.jpg",
        description: "\' post caption\'"+" groub name "+"في"+" user name "+"نشر "
    );
    NotificationModel n2=NotificationModel(
        time:"1h",
        IsRead: false,
        link: "link",
        image: "images/profile.jpg",
        description: ""
            "\' we are hiring software engineer \'"+" FCIH  "+"في"+" mohmed ahmed"+"نشر "
            ""
    );
    NotificationModel n3=NotificationModel(time:"5h",IsRead: false,link: "link", image: "images/profile.jpg", description: "group name 3");
    NotificationModel n4=NotificationModel(time:"6m",IsRead: true,link: "link", image: "images/profile.jpg", description: "group name 4");
    NotificationModel n5=NotificationModel(time:"8s",IsRead: false,link: "link", image: "images/profile.jpg", description: "group name 5");
    notifications.add(n1);
    notifications.add(n2);
    notifications.add(n3);
    notifications.add(n4);
    notifications.add(n5);
  }


  @override
  void initState() {
    super.initState();
    getNots();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // "notifications" + search icon
          Container(
            color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,bottom: 30,top: 18),
                    child: Text("Notfications ",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0,bottom: 30),
                    child: TextButton(onPressed: (){}, child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),color: Colors.black26),
                        child: Icon(Icons.search,color: Colors.black,size: 30,))),
                  )
                ],
              ),

          ),

          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (c,n){
                return Container(
                  margin: const EdgeInsets.only(top: 0.0),
                  height: 80,
                  decoration: BoxDecoration(color: notifications[n].IsRead?Colors.white:Colors.lightBlueAccent),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            padding: EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                notifications[n].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 12,left: 8),
                                height:60 ,
                                width: MediaQuery.of(context).size.width-90,
                                child: Text(
                                  notifications[n].description,
//                                notifications[n].description.length>80?notifications[n].description.substring(0,80):notifications[n].description,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 20,
                                      wordSpacing: 5,
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(notifications[n].time),
                              )
                            ],
                          ),
                        ],
                      ),
                      Positioned(right: 8,top: 8,child: IconButton( onPressed: () {  },icon: Icon(Icons.ac_unit,color: Colors.white,)))
                    ],
                  ),



                );
              }),
          ),
        ],
      ),
    );
  }
}

class NotificationModel{
  String description;
  String image;
  String link;
  bool IsRead;
  String time;
  NotificationModel({required this.time,required this.IsRead,required this.description, required this.image, required this.link});

}