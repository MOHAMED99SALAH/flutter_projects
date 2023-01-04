import 'package:animals/models/CharacterModel.dart';
import 'package:animals/widgets/charac_widget.dart';
import 'package:flutter/material.dart';

class Home_screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home_screen ();
  }

}
class _Home_screen extends State<Home_screen>{
  PageController pageController;
  int currentpage =0;


  @override
  void initState()
  {
    super.initState();
    pageController=PageController(
viewportFraction: 1.0,
      keepPage: false,
      initialPage: currentpage,
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(
  appBar: AppBar(
    leading: Icon(Icons.arrow_back_ios),
    elevation: 0.0,
    backgroundColor: Colors.white,
    actions: <Widget>[
      Padding(padding: EdgeInsets.only(right: 16),
      child:Icon(Icons.search) ,
      ),
    ],

  ),
  body: SafeArea(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 32,top: 8),
          child: RichText(text: TextSpan(
            children: [
              TextSpan(text: "Animales Kingdom",style: TextStyle(fontWeight:FontWeight.w600  ,fontSize: 41,letterSpacing:1.2,color: Colors.black)),
              TextSpan(text: "\n"),
              TextSpan(text: "Characters",style: TextStyle( fontSize: 34,letterSpacing: 1.1,fontWeight: FontWeight.normal,color: Colors.black)),
            ],
          )
          ),
        ),
        Expanded(child: PageView(
            physics: ClampingScrollPhysics(),
            controller: pageController,


            children: <Widget> [

          for(var i=0;i<characters.length;i++)
              charac_widget(charac : characters[i],pageController:pageController,currentpage:i)



        ]
        )),

        SizedBox(height: 5,),

      ],
    ),
  ),


);
  }

}