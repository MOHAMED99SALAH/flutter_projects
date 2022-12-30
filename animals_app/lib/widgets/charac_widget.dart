


import 'package:animals/models/model_char.dart';
import 'package:animals/pagaes/charac_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:animals/models/model_char.dart';

class charac_widget extends StatelessWidget
{
  final character charac ;

 final PageController pageController;
 final int currentpage ;

  charac_widget({ this.charac,this.pageController,this.currentpage}) ;

  @override
  Widget build(BuildContext context) {
    final screenhight =MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    // TODO: implement build
   return InkWell(
     onTap: (){
       Navigator.push(context, PageRouteBuilder(transitionDuration: Duration(milliseconds: 350), pageBuilder: (context,_,__) => chraclistscreen(chracter:charac)
       ));
     },
     child: AnimatedBuilder(
       animation: pageController,
       builder: (context,child)=> child,






       child: Stack(
children: <Widget>[
  Align(
        alignment:Alignment.bottomCenter ,
        child: ClipPath(
          clipper:Characclipper() ,
          child: Hero(
            tag: "background-${charac.name}",
            child: Container(
              height: .55*screenhight,
              width:screenwidth-30 ,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: charac.colors,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )
              ),
            ),
          ),
        ),
  ),


         Align(
          alignment: Alignment(0,-.5),
        child:Hero(tag: "image-${charac.name}",
          child: Image.asset(
            charac.imagepath,
            height:.5* screenwidth,
            width:.5* screenhight,

          ),
        ) ,
        ),
  Padding(padding: EdgeInsets.only(left: 24,bottom: 25),
  child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Hero(tag: "name-${charac.name}",
              child:  Material(color: Colors.transparent,child: Container(child: Text(charac.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40))))),
          Text("Tap To Read More",style: TextStyle(color: Colors.white,fontSize: 35)),

        ],
  )
        ,)

],



       ),
     ),
   );
  }



}
class Characclipper extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curvedistance =40;

    path.moveTo(0, size.height*.4);
    path.lineTo(0,size.height-curvedistance);
    path.quadraticBezierTo(1, size.height-1, curvedistance, size.height);
    path.lineTo(size.width-curvedistance, size.height);
    path.quadraticBezierTo(size.width+1, size.height-1,size.width ,size.height-curvedistance);
    path.lineTo(size.width, curvedistance);
    path.quadraticBezierTo(size.width-1, 0, size.width-curvedistance-5, curvedistance/3);
    path.lineTo( curvedistance,size.height*.29);
    path.quadraticBezierTo(1, (size.height*.30)+10, 0, size.height*.4);

    return path;




  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip

  }

  
}