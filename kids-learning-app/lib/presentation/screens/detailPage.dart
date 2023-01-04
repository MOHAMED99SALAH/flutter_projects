import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids/presentation/screens/hasNo_Internet.dart';
import 'history.dart';
import 'weblink.dart';
import 'package:lottie/lottie.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Detail extends StatelessWidget {
  DocumentSnapshot data;
  Detail(this.data);

  Future spelling(String text) async {
    final FlutterTts _flutterTts = FlutterTts();
    await _flutterTts.setLanguage("en-AU");
    await _flutterTts.setPitch(5);

    await _flutterTts.setSpeechRate(.4);
    await _flutterTts.speak(text);
  }

  void ShowMore(BuildContext context, String link) {
    if (link == "") {
      showSimpleNotification(
          Text(
            "some thing wrong , try later ",
            style: TextStyle(color: Colors.white),
          ),
          background: Colors.red);
    } else {
      //         launch("https://www.google.com/search?q=$tLink%5D&sxsrf=APq-WBu9hQMhmFK-dacxJI3G1IexEcdSFw:1649632536958&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjn6v-K0Ir3AhUC3qQKHaaJBGEQ_AUoAXoECAMQAw&biw=1396&bih=685&dpr=1.38");

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WebPage(
            "https://www.google.com/search?q=$link%5D&sxsrf=APq-WBu9hQMhmFK-dacxJI3G1IexEcdSFw:1649632536958&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjn6v-K0Ir3AhUC3qQKHaaJBGEQ_AUoAXoECAMQAw&biw=1396&bih=685&dpr=1.38");
      }));
    }
  }

  Widget page(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return history();
        }));
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "${data['title']}",
              style: TextStyle(fontSize: 15.sp, color: Colors.amberAccent[700]),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: Builder(builder: (context) {
              return IconButton(
                  onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return history();
                      })),
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.amberAccent[700],
                    size: 7.w,
                  ));
            }),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 1.h),
                  Center(
                    child: Container(
                        width: 100.w,
                        height: 50.h,
                        child: Hero(
                          tag: "99",
                          child: CachedNetworkImage(
                            imageUrl: data['image'],
                            imageBuilder: (context, imageProvider) => Container(
                              height: 50.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              )),
                            ),
                            placeholder: ((context, url) => Container(
                                  height: 50.h,
                                  width: 100.w,
                                  child: Image.asset("images/loadingPlace.gif"),
                                )),
                            errorWidget: ((context, url, error) => Container(
                                  height: 50.h,
                                  width: 100.w,
                                  child: Image.asset("images/loadingPlace.gif"),
                                )),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            child: GestureDetector(
                                onTap: () {
                                  ShowMore(context, data['title']);
                                },
                                child: Text(
                                  "see more..!",
                                  style: TextStyle(
                                      color: Colors.amberAccent[700],
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                          Container(
                            height: .2.h,
                            width: 25.w,
                            color: Colors.amberAccent[700],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        height: 7.h,
                        width: 22.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.black45, width: 1.0.w),
                        ),
                        child: IconButton(
                            onPressed: () => spelling(data['title']),
                            icon: Icon(
                              Icons.volume_up,
                              size: 7.5.w,
                              color: Colors.black87,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: .5.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.w)),
                    ),
                    height: 40.h,
                    child:
                        Lottie.asset("assets/back.json", fit: BoxFit.fitWidth),
                    width: 100.w,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return page(context);
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
