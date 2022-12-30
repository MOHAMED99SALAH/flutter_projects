

import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  void setImage(File image) {
    if (image != null) {
      emit(ImageLoaded(image));
    }
  
  }
}
