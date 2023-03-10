import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:kids/presentation/screens/hasNo_Internet.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:sizer/sizer.dart';

class WebPage extends StatefulWidget {
  String link;
  WebPage(this.link);
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  Widget page() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 7.w,
          ),
          color: Colors.amberAccent[700],
        ),
        elevation: 0,
        title: Text(
          "Images",
          style: TextStyle(fontSize: 16.sp, color: Colors.amberAccent[700]),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: WebView(
        initialUrl: widget.link,
        javascriptMode: JavascriptMode.unrestricted,
        zoomEnabled: true,
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
