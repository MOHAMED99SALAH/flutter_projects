import 'package:delicyfood/presentation/screens/all_pages/getstart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:overlay_support/overlay_support.dart';
import 'business/bloc/bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => CartBloc()),
      ],
      dependencies: [],
      child: OverlaySupport.global(
        child: MaterialApp(
          title: 'food',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

              //       primarySwatch: Colors.lightBlue,
              ),
          home: getstart(),
        ),
      ),
    );
  }
}
