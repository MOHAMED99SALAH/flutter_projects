

part of 'image_cubit.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoaded extends ImageState {
  File image;

  ImageLoaded(this.image);
}

