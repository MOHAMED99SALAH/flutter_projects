import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'business/bloc/foodlistbloc.dart';
import 'presentation/screens/Home.dart';
import 'business/bloc/blocstyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: MaterialApp(
        title: 'Food Cart',
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
