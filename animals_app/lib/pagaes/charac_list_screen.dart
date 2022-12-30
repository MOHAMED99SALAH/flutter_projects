import 'package:after_layout/after_layout.dart';
import 'package:animals/models/model_char.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class chraclistscreen extends StatefulWidget
{
  final character chracter;


  chraclistscreen({Key key,this.chracter}):super(key : key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _chraclistscreen();
  }

}
class _chraclistscreen extends State<chraclistscreen> with AfterLayoutMixin<chraclistscreen>
{
  double currentsheetpp=-330;
  double expandedsheet=0;
  double collapsedsheet=-250;
  double fullshaeet=-330;
  bool iscolapsed =false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final screenhieght =MediaQuery.of(context).size.height;
return Scaffold(body: Container(
  child: Stack(
    fit: StackFit.expand,

    children:<Widget>[
  Hero(
    tag: "background-${widget.chracter.name}",
    child: DecoratedBox(decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: widget.chracter.colors,
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,

    ),
),
),
  ),
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          SizedBox(height: 40,),
          Padding(padding: EdgeInsets.only(top: 8,left: 16),
            child: IconButton(icon:Icon (Icons.close),
              iconSize: 40,
          color: Colors.white.withOpacity(.5),
              onPressed: (){
              Future.delayed(Duration(milliseconds: 250),(){

                  setState(() {
                  currentsheetpp=-330;
              });
              });
              Navigator.pop(context);
              },
            ),
          ),
          Align(alignment: Alignment.topRight,
              child: Hero(tag: "image-${widget.chracter.name}"
                ,
                child: Image.asset(widget.chracter.imagepath,height: screenhieght*.45,
    ),
              ),
          ),
          Padding(padding:EdgeInsets.symmetric(horizontal: 32,vertical: 8) ,
          child:Hero(tag: "name-${widget.chracter.name}",
              child: Material(color: Colors.transparent,child: Container(child: Text(widget.chracter.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40)))))
          ),

          Padding(padding: EdgeInsets.fromLTRB(32, 0, 8, 16),
              child: Text(widget.chracter.description,style: TextStyle(color: Colors.white,fontSize: 30))),
        ],
    ),
      ),
      AnimatedPositioned(
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,

        left: 0,
        right: 0,
        bottom: currentsheetpp,
        child: Container(

decoration: BoxDecoration(
 color: Colors.white,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(40),
    topLeft: Radius.circular(40),
  ),
),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    InkWell(
      onTap: (){
        setState(() {
          currentsheetpp= iscolapsed ?0:-250;
          iscolapsed=!iscolapsed;
        });
      },
      child: Container(
        alignment: Alignment.center,
padding: EdgeInsets.symmetric(horizontal: 32),
        height: 80,
        child: Text("Clips", style:TextStyle( fontSize: 34,letterSpacing: 1.1,fontWeight: FontWeight.normal,color: Colors.black)),


      ),
    ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: addclip(),
    ),


  ],
),

        ),


      ),
  ]
  ),

),
);
  }
Widget addclip()
{
  return Container(
    height: 250,
    margin: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: <Widget>[
Column(
  children: <Widget>[
    roundcon(Colors.redAccent),
    SizedBox(height: 20,),
    roundcon(Colors.greenAccent),


  ],
),
        SizedBox(height: 16,),

        Column(
          children: <Widget>[
            roundcon(Colors.black),
            SizedBox(height: 20,),
            roundcon(Colors.blueAccent),


          ],
        ),
        SizedBox(height: 16,),

        Column(
          children: <Widget>[
            roundcon(Colors.deepOrange),
            SizedBox(height: 20,),
            roundcon(Colors.amber),


          ],
        ),
        SizedBox(height: 16,),

        Column(
          children: <Widget>[
            roundcon(Colors.cyan),
            SizedBox(height: 20,),
            roundcon(Colors.lime),


          ],
        ),
        SizedBox(height: 16,),

        Column(
          children: <Widget>[
            roundcon(Colors.cyan),
            SizedBox(height: 20,),
            roundcon(Colors.lime),


          ],
        ),
        SizedBox(height: 16,),


        Column(
          children: <Widget>[
            roundcon(Colors.cyan),
            SizedBox(height: 20,),
            roundcon(Colors.lime),


          ],
        ),
        SizedBox(height: 16,),


        Column(
          children: <Widget>[
            roundcon(Colors.cyan),
            SizedBox(height: 20,),
            roundcon(Colors.lime),


          ],
        ),
        SizedBox(height: 16,),






      ],
    ),
  );
}


Widget roundcon(Color coloor)
{
  return Container(
    height: 100,
    width: 100,

    decoration: BoxDecoration(
      color:coloor ,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),





  );
}

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500),(){
      setState(() {
        iscolapsed=true;
        currentsheetpp=-250;



      });

    });

  }
}
