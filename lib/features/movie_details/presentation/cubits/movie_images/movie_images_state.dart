part of 'movie_images_cubit.dart';

@freezed
class MovieImagesState with _$MovieImagesState {
  const factory MovieImagesState.initial() = _Initial;
  const factory MovieImagesState.loading() = _Loading;
  const factory MovieImagesState.error() = _Error;
  const factory MovieImagesState.loaded({
    required int id,
    required List<String> images,
  }) = _Loaded;
}
