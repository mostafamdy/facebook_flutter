import 'dart:async';

import 'package:facebook_flutter/screens/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';

class Login extends StatefulWidget {
  String email="";
  String password="";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // set animation here
  Widget startingAnimation = Container();
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //image
          Container(
            child: Image.asset(
              'images/login.jpg',
              fit: BoxFit.fill,
            ),
            height: 350,
            color: Colors.black,
          ),
          //Language
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
              ),
              TextButton(
                onPressed: () {
                  // change language
                  print("language changed to arabic");
                },
                child: Text(
                  "ُالعربيه",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              TextButton(
                onPressed: () {
                  // change language
                  print("language changed to espanol");
                },
                child: Text(
                  "Espanol",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              TextButton(
                child: Text("More...",
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
                onPressed: () {
                  // change language
                  print("more pressed");
                },
              )
            ],
          ),
          //email
          Container(
            child: TextField(
              onChanged: (data){widget.email=data;},
              decoration: InputDecoration(
                  hintText: "phone or email",
                  hintStyle: TextStyle(fontSize: 18)),
            ),
            padding: EdgeInsets.only(
                top: 30,
                left: MediaQuery.of(context).size.width / 6,
                right: MediaQuery.of(context).size.width / 6),
          ),
          //password
          Container(
            child: TextField(
              onChanged: (data){widget.password=data;},
              decoration: InputDecoration(
                  hintText: "password", hintStyle: TextStyle(fontSize: 18)),
            ),
            padding: EdgeInsets.only(
                top: 25,
                left: MediaQuery.of(context).size.width / 6,
                right: MediaQuery.of(context).size.width / 6),
          ),
          //login
          Container(
            color: Colors.blue,
            margin: EdgeInsets.only(
              top: 25,
              right: MediaQuery.of(context).size.width / 6,
              left: MediaQuery.of(context).size.width / 6,
            ),
            child: TextButton(
              onPressed: () {
                print("email = ${widget.email}");
                print("password = ${widget.password}");
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>AppBarFaceBook()), (Route<dynamic> route) => false);
                },
              child: Container(
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          //forgot password
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 6,
              right: MediaQuery.of(context).size.width / 6,
            ),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                )),
          ),
          SizedBox(
            height: 50,
          ),
          // ----OR----
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Divider(
                  color: Colors.black38,
                ),
                width: MediaQuery.of(context).size.width / 2 - 50,
              ),
              Container(alignment: Alignment.center, child: Text("OR")),
              Container(
                child: Divider(
                  color: Colors.black38,
                ),
                width: MediaQuery.of(context).size.width / 2 - 50,
              )
            ],
          ),
          //create new account
          Container(
            margin: EdgeInsets.only(top: 30,left: MediaQuery.of(context).size.width /3.8 ,right: MediaQuery.of(context).size.width / 3.8),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Create New Facebook Account",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),

              ),
            ),
          )
        ],
      ),
    );
  }//https://www.elkhouly.net/resources/views/Pages/course.blade.php
}
