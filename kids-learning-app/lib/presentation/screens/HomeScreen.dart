import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:kids/business/cubit/image_cubit.dart';
import 'package:kids/presentation/screens/hasNo_Internet.dart';
import '../../data/entities/image.dart';
import '../widgets/sidebar.dart';
import '../../data/entities/user.dart';
import 'package:lottie/lottie.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:tflite/tflite.dart';
import 'dart:io';
import 'package:translator/translator.dart';
import 'package:sizer/sizer.dart';
import 'history.dart';
import 'package:intl/intl.dart';

import 'package:image_picker/image_picker.dart';
import 'getstart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Child online_USER;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String collectionName = "Image";
  String userdata = "Images";
  bool isloading = false;
  String tLink = "";
  Image imageee;
  int loaded = 0;
  File iimage;
  bool loading = true;
  List _output;
  String textt = "unknown";
  ImagePicker _imagePicker = ImagePicker();
  String translate_text = "";
  GoogleTranslator _googleTranslator = GoogleTranslator();
  ImageModel img;

  @override
  void initState() {
    loadData();
    online_USER = Child.online(Getstart.name_user, Getstart.phone);
    loadmodel().then((value) {
      setState(() {});
    });
  }

// translate
  void translate() {
    _googleTranslator
        .translate(translate_text, from: 'en', to: 'es')
        .then((output) {
      setState(() {
        translate_text = output as String;
      });
    });
  }

  showmessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(milliseconds: 500),
    ));
  }

// upload images to firebase
  uploadImage() async {
    try {
      final now = DateTime.now();
      String date = DateFormat('dd-MM-yyyy  KK-mm').format(now);
      setState(() {
        isloading = true;
      });
      var uniquekey = _firebaseFirestore.collection(collectionName).doc();
      String uploadFileName =
          DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';
      Reference reference =
          _firebaseStorage.ref().child(collectionName).child(uploadFileName);
      UploadTask uploadTask = reference.putFile(iimage);
      uploadTask.snapshotEvents.listen((event) {
        print(event.bytesTransferred.toString() +
            "/t" +
            event.totalBytes.toString());
      });
      await uploadTask.whenComplete(() async {
        var uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
        // create image
        img = ImageModel(uploadPath, tLink, Getstart.name_user, date, uniquekey.id);
        if (uploadPath.isNotEmpty) {
          _firebaseFirestore.collection(collectionName).doc(uniquekey.id).set({
            "id": img.id,
            "Id": img.Id,
            "image": img.image_url,
            "title": img.title,
            "date": img.date,
          });
        } else {
          showmessage("something");
        }
        setState(() {
          isloading = false;
        });
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.blueGrey,
      ));
    }
  }

  //load model from files
  loadmodel() async {
    await Tflite.loadModel(
        model: "assets/tflite/mobilenet_v1_1.0_224.tflite",
        labels: "assets/tflite/mobilenet_v1_1.0_224.txt");
  }

  //image to model
  loadImagetoModel(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 127.5,
        imageStd: 127.5,
        numResults: 1,
        threshold: 0.1);
    setState(() {
      if (output.length == 0) {
        loaded = 0;
      } else {
        loaded = 1;
        loading = false;
        _output = output;

        setState(() {
          tLink = _output[0]["label"];
          //translate_text=_output[0]["label"];
        });
      }
    });
  }

  // get image from the gallary
  Future pickimage() async {
    var image = await _imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      iimage = File(image.path);
      BlocProvider.of<ImageCubit>(context).setImage(iimage);
    });
    loadImagetoModel(iimage);
    if (Getstart.name_user == "") {
      showSimpleNotification(
          Text(
            "some thing wrong  ,try later",
            style: TextStyle(color: Colors.white),
          ),
          background: Colors.red);
    } else {
      uploadImage();
    }
  }

  // get image from the camera
  Future getimage() async {
    try {
      var image = await _imagePicker.getImage(source: ImageSource.gallery);
      setState(() {
        iimage = File(image.path);
        BlocProvider.of<ImageCubit>(context).setImage(iimage);
      });
      loadImagetoModel(iimage);
      if (Getstart.name_user == "") {
        showSimpleNotification(
            Text(
              "some thing wrong  ,try later",
              style: TextStyle(color: Colors.white),
            ),
            background: Colors.red);
      } else {
        uploadImage();
      }
    } on PlatformException catch (e) {
      showSimpleNotification(
          Text(
            "some thing wrong  ,try later",
            style: TextStyle(color: Colors.white),
          ),
          background: Colors.red);
    }
  }

  // get user data  from shared
  loadData() async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();
    setState(() {
      if (shared_data.getString("NAME") != "" ||
          shared_data.getString("USERNAME") != "" ||
          shared_data.getString("PHONE") != "" ||
          shared_data.getBool("STATE") == false) {
        Getstart.Name = shared_data.getString("NAME");
        Getstart.name_user = shared_data.getString("USERNAME");
        Getstart.phone = shared_data.getString("PHONE");
        Getstart.state = shared_data.getBool("STATE");
      } else {
        Getstart.Name = "";
        Getstart.name_user = "";
        Getstart.phone = "";
        Getstart.state = false;
      }
    });
  }

  Widget page() {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
        drawer: Sidebar(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.view_headline,
                  color: Colors.amberAccent[700],
                  size: 7.w,
                ));
          }),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 3.w),
                child: IconButton(
                  icon: Icon(Icons.photo_library_outlined),
                  color: Colors.amberAccent[700],
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return history();
                    }));
                  },
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 1.h,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Text(
                    "Let's ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Text(
                    "Know more about the things ..! ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 8.h,
              ),
              Center(
                child: Container(child: BlocBuilder<ImageCubit, ImageState>(
                  builder: (context, state) {
                    if (iimage == null) {
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.w)),
                          ),
                          child: Lottie.asset("assets/take-photo.json",
                              fit: BoxFit.fill),
                          height: 40.h,
                          width: 80.w,
                        ),
                      );
                    } else if (state is ImageLoaded) {
                      return Center(
                          child: Container(
                              width: 100.w,
                              height: 50.h,
                              child: Image.file(
                                state.image,
                                fit: BoxFit.cover,
                              )));
                    }
                  },
                )),
              ),
              SizedBox(
                height: 1.h,
              ),
              Center(
                child: loaded == 0
                    ? Text(
                        "",
                        style: TextStyle(
                            fontSize: 0.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "${_output[0]["label"]}",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          //     Text("${(_output[0]["confidence"]*100 as double).toStringAsFixed(2)+" " +"%"} ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orange),)

                          Container(
                            height: 10.h,
                            width: 13.2.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.black45, width: 1.w),
                            ),
                            child: IconButton(
                                onPressed: () =>
                                    online_USER.spelling(_output[0]["label"]),
                                icon: Icon(
                                  Icons.volume_up,
                                  size: 7.5.w,
                                  color: Colors.black87,
                                )),
                          ),
                        ],
                      ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                child: tLink == ""
                    ? Container()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: GestureDetector(
                                onTap: () {
                                  online_USER.ShowMore(context, tLink);
                                },
                                child: Text(
                                  "see more..!",
                                  style: TextStyle(
                                      color: Colors.amberAccent[700],
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                          Container(
                            height: .2.h,
                            width: 25.w,
                            color: Colors.amberAccent[700],
                          )
                        ],
                      ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,

          children: <Widget>[
            FloatingActionButton(
              onPressed: () async {
                getimage();
              },
              backgroundColor: Colors.amberAccent[700],
              child: Icon(
                Icons.image,
                size: 8.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: FloatingActionButton(
                onPressed: () async {
                      pickimage();
                },
                backgroundColor: Colors.amberAccent[700],
                child: Icon(
                  Icons.add_a_photo,
                  size: 8.w,
                ),
              ),
            ),
          ],
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
          return NoInternet();
        }
      },
      child: Center(
          child: CircularProgressIndicator(
        color: Colors.teal[700],
      )),
    );
  }
}
