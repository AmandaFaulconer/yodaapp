import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Translator extends StatefulWidget{

  @override
  _Translator createState() => _Translator();
}

class _Translator extends State<Translator>{

  ////////////////Yoda Translator////////////////////

  final _controller = TextEditingController();
  final _controller2 = TextEditingController();
  /*
  api code: EEgdOQD35YRVJRpVjiQyxgeF
   */
  final Map<String, String> headerData= {
    "X-FunTranslations-Api-Secret": "EEgdOQD35YRVJRpVjiQyxgeF"
  };

  String testvar = " ";
  void updateText (){
    setState(() {
      testvar = _controller2.text;
    });
  }

  Future getYoda() async{
    if(testvar != null){
    var url = "https://api.funtranslations.com/translate/yoda.json?text=" + testvar;
    http.Response response = await http.get(url, headers:headerData);
    var YodaData = jsonDecode (response.body);
    //uncomment this print statement if you want to see the return in the console
    //print(YodaData['contents']['translated']);
    return YodaData['contents']['translated'];}
    else{
      return " ";
    }
  }

  //box decorator for the output text
  BoxDecoration myBoxDecoration(){
  return BoxDecoration(
      border: Border.all(
        //change the width of the box here
        width: 5.0,
        color: Color(0xff62542a),),
  );
}


  Widget YodaWidget(BuildContext context){
    return FutureBuilder(
        future: getYoda(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          Widget myWidget;
          if(snapshot.hasData){
            //edit to output text here
            myWidget = Container(
                height: 55.0,
                width: 100.0,
                decoration: myBoxDecoration(),
                padding: EdgeInsets.only(top: 10.0, left: 5.0),
                child: Text("${snapshot.data}",
                  style: TextStyle(fontSize: 18.0),
                ),
            );
          } else if(snapshot.hasError){
            myWidget = Text("${snapshot.error}");
          } else {
            myWidget = Column(children:[
              SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('Wait no more you must!')
              )
            ]
            );
          }
          return myWidget;
        }
    );
  }
  ////////////////////////////////////////////////////////////


  @override
  Widget build(BuildContext context)
  {
    _controller.text= " ";
    return Scaffold(
      backgroundColor: Color(0xfffae7652),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xffa4c4a4),
          )
      ),
      body: Container(
          padding:  EdgeInsets.all(20.0),
          child: Center(
              child: ListView(
                  children: <Widget>[
                    header,
                    img,
                    InputTopText,
                    Container(
                      height: 55.0,
                      width: 100.0,
                      child: TextField(
                        controller: _controller2,
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff62542a), width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff62542a), width: 5.0),
                          ),
                          hintText: 'Input text here that you wish to translate',
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: Color(0xff573d28),
                      elevation: 5.0,
                      splashColor: Color(0xffa4c4a4),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)
                      ),
                      child: Text("Translate",
                        style: TextStyle(
                            color: Color(0xfff7ad90),
                            fontSize: 18.0
                        ),
                      ),
                      onPressed: (){
                        updateText();
                      },
                    ),
                    outputheadingtext,
                  YodaWidget(context),
                  ]
              )
          )
      ),
    );
  }

//Widgets for the page

//page header
Widget header = Padding(
  padding: EdgeInsets.all(15.0),
  child: Text("Translate here, you will!",
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 30.0,
    fontStyle: FontStyle.italic,
  ),),
);

//page image
Widget img = Container(
    margin: EdgeInsets.only(bottom: 20.0),
    child: Image.asset("images/yoda_light.jpg"),
);

//heading for the input text bow
Widget InputTopText = Container(
  margin: EdgeInsets.only(bottom: 15.0),
  child: Text("Welcome to your personal Yoda translator!",
  style: TextStyle(
    fontSize: 18.0
  ),),
);

//heading text for the output of the translation
  Widget outputheadingtext = Container(
    margin: EdgeInsets.only(bottom: 15.0),
    child: Text("Here is your translation",
      style: TextStyle(
          fontSize: 18.0
      ),),
  );

}