import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:transparent_image/transparent_image.dart';
import 'popup.dart';
import 'popup_content.dart';

class Razorcrest extends StatefulWidget{

  @override
  _Razorcrest createState() => _Razorcrest();
}

class _Razorcrest extends State<Razorcrest>{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Color(0xfffae7652),
      body: Container(
          padding:  EdgeInsets.all(20.0),
          child: Center(
              child: Column(
                  children: <Widget>[
                    header,
                    img,
                    information,
                  ]
              )
          )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfff7ad90),
        onPressed: (){
          showPopup(context, _popupBody(), "About");
        },
        tooltip: 'Open Popup',
        child: Icon(
          Icons.add,
          color: Color(0xff573d2b),
          size: 40.0,
        ),
      ),
    );
  }
} // end of class

//Widgets for home page
/*Widget homeImg = FittedBox(
  child: Image.asset("image/home_image.jpg",),
  fit: BoxFit.fitWidth,
);*/

//Typewriter animated text for the title
Widget header = SizedBox(
  width: 300.0,
  height: 150,
  child: TypewriterAnimatedTextKit(
    text:["The \nRazor Crest"],
    textStyle: TextStyle(
      fontSize: 50.0),
    textAlign: TextAlign.start,
    alignment: AlignmentDirectional.topStart,
  ),
);

//Fade in the main page image
Widget img = Padding(
  padding: EdgeInsets.all(5.0),
      child: Image.asset('images/razorcrest.png'),
);


//Facts about the Razor Crest
//??How to add a border around the facts

Widget information = Container(
  padding: EdgeInsets.only(top: 50.0, left: 20.0),
  child: FadeAnimatedTextKit(
    text: [
      "It took creators two months to make",
      "Made out of a two foot model created by John Goodsoon",
      "Used motion control shots to make the show",
      "The first model was made in 1977 ",
      "A gunship that is used by the Mandalorian bounty hunter",
      "Prior to the rise of the Galactic Empire, it served as a military patrol craft.",
      "It is the home for Din Djarin and the Child in the Mandalorian",

    ],
    textStyle: TextStyle(
      fontSize: 18.0
    ),
    textAlign: TextAlign.start,
    alignment: AlignmentDirectional.topStart,
  ),
);


//pop up information goes here
Widget _popupBody(){
  return ListView(
    padding: const EdgeInsets.all(5.0),
    children: <Widget>[
      //header
      Text("About text will go here",
        style: TextStyle(fontSize: 20.0),
        textAlign: TextAlign.center,
        strutStyle: StrutStyle(height: 3.5),
      ),
    ],
  );
}

//change the look of the pop up here
showPopup(BuildContext context, Widget widget, String title,
    {BuildContext popupContext}) {
  Navigator.push(
    context,
    PopupLayout(
      top: 30,
      left: 30,
      right: 30,
      bottom: 50,
      child: PopupContent(
        content: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xffa4c4a4),
            title: Text("About",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.0,
                  color: Color(0xff573d2b)
              ),),
            leading: new Builder(builder: (context) {
              return IconButton(
                icon: Icon(Icons.arrow_back,
                  color: Color(0xff62542a),
                  size: 30.0,),
                onPressed: () {
                  try {
                    Navigator.pop(context); //close the popup
                  } catch (e) {}
                },
              );
            }),
            brightness: Brightness.light,
          ),
          resizeToAvoidBottomPadding: false,
          body: widget,
        ),
      ),
    ),
  );
}

class PopupContent extends StatefulWidget {
  final Widget content;

  PopupContent({
    Key key,
    this.content,
  }) : super(key: key);

  _PopupContentState createState() => _PopupContentState();
}

class _PopupContentState extends State<PopupContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.content,
    );
  }
}