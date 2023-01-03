import 'package:flutter/material.dart';

class Advertise extends StatefulWidget {
  final String image;
  final String resName;
  final String Description;
  final String status;

  Advertise(this.image, this.resName, this.Description, this.status);

  @override
  _AdvertiseState createState() => _AdvertiseState();
}

class _AdvertiseState extends State<Advertise>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 210))
          ..repeat();
    _animation = Tween(begin: 50.0, end: 200.0).animate(_animationController)
      ..addStatusListener((status) {})
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _AdvertiseState();
  @override
  Widget build(BuildContext context) {
    double ReallyWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.teal[100],
      ),
      height: 190,
      width: ReallyWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.contain,
                )),
            height: 150,
            width: 150,
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text(widget.resName,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.all_inclusive_rounded),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(widget.Description,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text(widget.status,
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87)),
                  Transform.rotate(
                    angle: 3.14 / 2 * _animation.value,
                    child: Icon(Icons.delivery_dining),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
