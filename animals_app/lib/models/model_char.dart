import 'package:flutter/material.dart';


class character{

  final String name ;
  final String description;
  final String imagepath;
  final List<Color> colors ;

  character({this.name, this.description, this.imagepath, this.colors});
}
List characters=[
character(
  name: "panther",
  description: "Black Panthers do not have any Symbiotic Relationships. Symbiotic  Relationships are when two or more animals that are different species that give benefits to each other. - Clown Fish and Anemone, the Clown Fish clean the Anemone whilst the Anemone keep the Clown Fish safe.",
  imagepath: "assets/images/panther.png",
  colors: [Colors.orange.shade200,Colors.deepOrange.shade400],
),
  character(
    name: "pafulo",
    description: "Buffalo live mostly on the plains, but some are known to inhabit river valleys as well as forests. Buffalo and bison played an important role on the North American plains for many years.",
    imagepath: "assets/images/paf.png",
    colors: [Colors.pink.shade200,Colors.redAccent.shade400],
  ),


];
