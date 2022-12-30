import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:kids/presentation/screens/HomeScreen.dart';
import 'package:kids/presentation/screens/getstart.dart';
import 'package:kids/presentation/screens/hasNo_Internet.dart';
import 'package:kids/presentation/widgets/itemShape.dart';
import 'package:lottie/lottie.dart';

import 'package:sizer/sizer.dart';

class history extends StatefulWidget {
  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<history> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String collectionName = "Image";
  String userid;
  String userdata = "Images";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> refrshpage() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => history(),
            transitionDuration: Duration(seconds: 0)));
  }

  Widget page() {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return home();
        }));
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "history",
            style: TextStyle(fontSize: 15.sp, color: Colors.amberAccent[700]),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return home();
                    })),
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.amberAccent[700],
                  size: 7.w,
                ));
          }),
          elevation: 0,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 2.5.w),
                child: IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 7.w,
                  ),
                  color: Colors.amberAccent[700],
                  onPressed: () async {
                    var collection =
                        FirebaseFirestore.instance.collection(collectionName);
                    var snapshots = await collection.get();
                    for (var doc in snapshots.docs) {
                      await doc.reference.delete();
                    }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return history();
                    }));
                  },
                ))
          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: refrshpage,
            child: Column(
              children: <Widget>[
                Expanded(
                    child: FutureBuilder<QuerySnapshot>(
                        future: _firebaseFirestore
                            .collection(collectionName)
                            .where('id', isEqualTo: getstart.name_user)
                            .get(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.amberAccent[700],
                              ),
                            );
                          }

                          if (snapshot.data.size != 0) {
                            List<DocumentSnapshot> photos = snapshot.data.docs;
                            return ListView.builder(
                                itemCount: photos.length,
                                itemBuilder: (context, index) {
                                  return itemShape(photos[index]);
                                });
                          } else {
                            return Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.w)),
                                ),
                                child: Lottie.asset("assets/no-data.json",
                                    fit: BoxFit.fill),
                                height: 40.h,
                                width: 90.w,
                              ),
                            );
                          }
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return page();
        } else {
          return noInternet();
        }
      },
      child: Center(
          child: CircularProgressIndicator(
        color: Colors.amberAccent[700],
      )),
    );
  }
}
