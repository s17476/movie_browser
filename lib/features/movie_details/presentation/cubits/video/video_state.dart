part of 'video_cubit.dart';

@freezed
class VideoState with _$VideoState {
  const factory VideoState.initial() = _Initial;
  const factory VideoState.loading() = _Loading;
  const factory VideoState.error() = _Error;
  const factory VideoState.loaded({required VideoList videos}) = _Loaded;
}
