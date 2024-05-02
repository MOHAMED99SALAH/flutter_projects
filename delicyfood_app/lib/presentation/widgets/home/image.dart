import 'package:flutter/material.dart';

class image extends StatefulWidget {
  final String imgPath;

  image(this.imgPath);

  @override
  State<image> createState() => _imageState();
}

class _imageState extends State<image> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(widget.imgPath),
              fit: BoxFit.contain,
            )),
        height: 190,
        width: MediaQuery.of(context).size.width - 10,
      ),
    );
  }
}
