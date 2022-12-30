import 'package:flutter/material.dart';




class CollapsList extends StatefulWidget {


  final String title ;
  final IconData icon ;
  final VoidCallback Callback ;


  CollapsList({ this.title, this.icon,this.Callback});


  @override
  _CollapsListState createState() => _CollapsListState();
}

class _CollapsListState extends State<CollapsList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.Callback,
      child: Column(
        children  : <Widget>[ Row(
          children: <Widget>[
            Icon(widget.icon,color: Colors.teal[700],size: 30,),
            SizedBox(width: 35,),
            Text(widget.title,style: TextStyle(color: Colors.teal[700],fontSize: 17,fontWeight: FontWeight.w600)),


          ],
        ),
          SizedBox(height: 45,),

      ]
      ),
    );
  }
}
