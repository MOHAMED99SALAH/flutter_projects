import 'package:bagshop/data/data_source/data.dart';
import 'package:bagshop/presentation/screens/detailed_page.dart';
import 'package:bagshop/presentation/widgets/wigets_home/category.dart';

import 'package:bagshop/presentation/widgets/wigets_home/item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home();

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.black12,
        items: [
          Icon(
            Icons.person_rounded,
            size: 40,
          ),
          Icon(
            Icons.home_filled,
            size: 40,
          ),
          Icon(
            Icons.history_outlined,
            size: 40,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.dehaze_outlined,
                    color: Colors.black,
                    size: 35,
                  )),
              SizedBox(
                width: 230,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                    size: 35,
                  )),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Our           ",
                        style: TextStyle(
                          fontSize: 30,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Products",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                width: 120,
              ),
              Container(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 40,
                    )),
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Categories(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        products[index],
                        () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                products[index],
                              ),
                            )),
                      );
                    })),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );

    ;
  }
}
