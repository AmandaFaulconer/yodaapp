//Final App
//Amanda Faulconer

/*
Final Mobile Apps Project

● a minimum of three images (this can include logos, etc)
● a stateful widget(s)
● navigation
 *bottom/ top navigation
● an about tab or equivalent
 *a page about who put this out - name, version, ect.
● must have a defined purpose
 *make the app about something
 *no fake text
● a min of two drawers, tabs or equivalent or pages
 *drawer go on the side
 *tabs go on the top or bottom (navigation)
● you are encouraged to connect to a datasource
 *find something funny? if easy? api?
 *a file/ api/ persistant data source
● polished and acceptable to present to an employer
● code must be formatted and commented
 *create a zip file for the entire project
 *also create a txt file for the main source code
 */

/*
Hexadecimal colors:
red: c83444
peach: f7ad90
olive: 62542a
light tan: ae7652
green: a4c4a4
tan: 573d2b
 */

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './razorcrest.dart';
import './yoda.dart';
import './translator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [
    Razorcrest(),
    Yoda(),
    Translator(),
  ];

  BottomNavigationBarItem myBItem1() {
    return BottomNavigationBarItem(
        backgroundColor: Color(0xff573d2b),
        icon: Icon(Icons.airplanemode_active),
        title: Text(
          "Razorcrest",
          style: TextStyle(letterSpacing: 0.7, fontSize: 16.0),
        ));
  }

  BottomNavigationBarItem myBItm2() {
    return BottomNavigationBarItem(
        backgroundColor: Color(0xff573d2b),
        icon: Icon(Icons.star_half),
        title: Text(
          "Yoda",
          style: TextStyle(letterSpacing: 0.7, fontSize: 16.0),
        ));
  }

  BottomNavigationBarItem myBItem3() {
    return BottomNavigationBarItem(
        backgroundColor: Color(0xff573d2b),
        icon: Icon(Icons.translate),
        title: Text(
          "Translator",
          style: TextStyle(letterSpacing: 0.7, fontSize: 16.0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: AppBar(
                  centerTitle: true,
                  backgroundColor: Color(0xffa4c4a4),
                  title: Text("The Jedi Way",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Color(0xff573d2b)))
              )
          ),
          backgroundColor: Color(0xffae7652),
          body: _pageOptions[_selectedPage],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Color(0xffc83444),
            unselectedItemColor: Color(0xff573d2b),
            backgroundColor: Color(0xffa4c4a4),
            currentIndex: _selectedPage,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: [myBItem1(), myBItm2(), myBItem3()],
          ),
        ));
  }
}



