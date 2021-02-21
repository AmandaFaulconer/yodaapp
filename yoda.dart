import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'popup.dart';
import 'popup_content.dart';

class Yoda extends StatefulWidget{

  @override
  _Yoda createState() => _Yoda();
}

class _Yoda extends State<Yoda>{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Color(0xfffae7652),
      body: Container(
          padding:  EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
          child: Center(
              child: Column(
                  children: <Widget>[
                    Text("Learn More, You Shall",
                      style: TextStyle(fontSize: 30.0,
                        fontStyle: FontStyle.italic,),
                    textAlign: TextAlign.center,),
                    babyYodaImg,
                    yodaImg,
                    textBox,
                  ]
              )
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfff7ad90),
        onPressed: (){
          showPopup(context, _popupBody(), "Yoda Knowledge");
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
}

//first page image
Widget babyYodaImg = Padding(
  padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
  child: Image.asset("images/baby_yoda.jpg"),
);

//second page image
Widget yodaImg = Padding(
  padding: EdgeInsets.only(bottom: 10.0,),
  child: Image.asset("images/yoda.jpg"),
);

//text box
Widget textBox = Container(
  margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
  padding: const EdgeInsets.all(3.0),
    decoration: myBoxDecoration(),
      child: Text("Click the peach button, you will!",
        style: TextStyle(fontSize: 18.0,),),
);


BoxDecoration myBoxDecoration(){
  return BoxDecoration(
    border: Border.all(
        //change the width of the box here
        width: 3.0,
        color: Color(0xff62542a),),
    borderRadius: BorderRadius.all(Radius.circular(5.0))
  );
}

Widget _popupBody(){
  return ListView(
    padding: const EdgeInsets.all(5.0),
    children: <Widget>[
      //header
      Text("Yoda Facts", style: TextStyle(fontSize: 20.0),
        textAlign: TextAlign.center,
        strutStyle: StrutStyle(height: 3.5),
      ),

      Text("1. Yoda's first name was never mentioned because Grorge Lucas"
          "wanted to leave him with just one name to enhance the mystery that "
          "surrounds him. There are theroies that his first name is Minch, however"
          "Minch is another Jedi who is the same species as Yoda.\n\n"
          "2. Yoda was born in 896 BBY (Before the Battle of Yavin) and died in "
          "4 ABY (After the Battle of Yavin). This made Yoda 900 Years old.\n\n"
          "3. Yoda is 66cm tall and 17 kg in weight.\n\n"
          "4. Yoda's species were never explained, or given a name. \n\n"
          "5. The most famous members of Yoda's species are Baby Yoda, Minch, "
          "Oteg, Vandar Tokare, Yaddle and Yoda himself.\n\n"
          "6. Yoda is one of the few Jedi (and Sith) who kept his robe on during"
          "combat.\n\n"
          "7. In less than 100 years, Yoda achiever the tital and rank of Jedi Master.\n\n"
          "8. Yoda used a cane to help him walk in his later life, although he was "
          "capable of throwing it aside and moving quickly while using the Force. \n\n"
          "9. Yoda was a master of lightsaber combat, he was one of the greatest "
          "duelists of all time.\n",
        style: TextStyle(fontSize: 15.0, height: 1.5,),),

      Divider(color: Color(0xff62542a), thickness: 3.0,),
      //header
      Text("Baby Yoda Facts", style: TextStyle(fontSize: 20.0),
      textAlign: TextAlign.center,
        strutStyle: StrutStyle(height: 3.5),),

      Text("1. Baby Yoda is 50 years old.\n\n"
          "2. He has force-healing abilities.\n\n"
          "3. He was found on a desert planet called Arvala-7.\n\n"
          "4. He eats soup, and frogs.\n\n"
          "5. He is as inquisitive as any baby, playing witha  metal shift knob from Mando's shiip"
          "even when told not to.\n\n"
          "6. He is a mysterious creature we are all eager to learn more about.\n\n\n",
      style: TextStyle(fontSize: 15.0, height: 1.5,),),
    ],
  );
}

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
            title: Text("Yoda Knowledge",
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