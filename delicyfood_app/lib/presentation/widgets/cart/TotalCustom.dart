import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../../business/bloc/bloc.dart';
import '../../../business/bloc/centralProvider.dart';

class TotalCustom extends StatelessWidget
{



  final CartBloc bloc =BlocProvider.getBloc<CartBloc>();

  @override
  Widget build(BuildContext context) {
    double  ReallyWidth =MediaQuery.of(context).size.width;
    var cost =Provider.of<TotalPrice>(context);
    // TODO: implement build
        return Container(
          width: ReallyWidth,
          child: Column(

            children: <Widget>[
              Container(
                height: 2,
                color: Colors.grey[400],
              ),
              SizedBox(height: 10,),

              Text("Minimum order : 15 LE",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300,color: Colors.red)),
              SizedBox(height: 30,),
              Row(

                children: <Widget>[

                  SizedBox(width: 35,),
                  Text(" ${cost.num} LE " ,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight:FontWeight.w600),),
                  SizedBox(width: 120,),
                  Text("Total Cost" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black))
                ],
              ),
              SizedBox(height: 35,),

              Container(
                height: 2,
                color: Colors.grey[400],
              ),

            ],

          ),
        );
      }



}


