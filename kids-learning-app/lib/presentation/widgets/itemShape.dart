import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kids/presentation/screens/detailPage.dart';
import 'package:kids/presentation/screens/history.dart';
import 'package:path/path.dart' as p;
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemShape extends StatelessWidget {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String collectionName = "Image";
  String userid;
  String userdata = "Images";

  DocumentSnapshot data;

  ItemShape(this.data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Detail(data);
        }));
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: Material(
            color: Colors.white,
            elevation: 2,
            child: Container(
              height: 18.h,
              width: 95.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(.5.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.w),
                            bottomRight: Radius.circular(10.w)),
                      ),
                      child: Hero(
                        tag: "99",
                        child: CachedNetworkImage(
                          imageUrl: data['image'],
                          imageBuilder: (context, imageProvider) => Container(
                            height: 19.h,
                            width: 33.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            )),
                          ),
                          placeholder: ((context, url) => Container(
                                height: 19.h,
                                width: 33.w,
                                child: Image.asset("images/loadingPlace.gif"),
                              )),
                          errorWidget: ((context, url, error) => Container(
                                height: 19.h,
                                width: 33.w,
                                child: Image.asset("images/loadingPlace.gif"),
                              )),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        data['title'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.amberAccent[700]),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Center(
                          child: Text(
                            data['date'].toString(),
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () async {
                        _firebaseFirestore
                            .collection(collectionName)
                            .doc(data['Id'])
                            .delete();
                        var fileUrl = Uri.decodeFull(p.basename(data['image']))
                            .replaceAll(new RegExp(r'(\?alt).*'), '');
                        FirebaseStorage.instance.ref().child(fileUrl).delete();

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return history();
                        }));
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black87,
                        size: 7.w,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
