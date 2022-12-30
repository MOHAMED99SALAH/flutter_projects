import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class ColorBloc extends BlocBase {
  ColorBloc();

  var colorcontroller = BehaviorSubject<Color>.seeded(Colors.white);

  Stream<Color> get colorstream => colorcontroller.stream;

  Sink<Color> get colorsink => colorcontroller.sink;
  Setcolor(Color color) {
    colorsink.add(color);
  }

  @override
  void dispose() {
    colorcontroller.close();
    super.dispose();
  }
}
