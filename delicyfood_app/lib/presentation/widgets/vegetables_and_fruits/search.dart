import 'package:delicyfood/presentation/widgets/vegetables_and_fruits/shapeItem.dart';
import 'package:flutter/material.dart';
import '../../../data/models/product.dart';

class dataSearch extends SearchDelegate<String> {
  List<product> data;
  List<product> resultdata;

  bool found = true;
  List<product> nulldata = [];

  dataSearch({this.data});

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = "";
            showSuggestions(context);
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    var realdata = query.isEmpty
        ? nulldata
        : data.where((p) => p.name.startsWith(query)).toList();
    return ListView.builder(
        itemCount: realdata.length,
        itemBuilder: (context, index) {
          return Shape(realdata[index]);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    var searcheddata = query.isEmpty
        ? nulldata
        : data.where((p) => p.name.startsWith(query)).toList();
    return ListView.builder(
        itemCount: searcheddata.length,
        itemBuilder: (context, index) {
          return Shape(searcheddata[index]);
        });
  }
}
