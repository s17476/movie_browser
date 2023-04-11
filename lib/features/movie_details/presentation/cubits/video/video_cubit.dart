import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/video_list.dart';
import '../../../domain/repositories/movie_details_repository.dart';
import '../movie_details/movie_details_cubit.dart';

part 'video_cubit.freezed.dart';
part 'video_state.dart';

@singleton
class VideoCubit extends Cubit<VideoState> {
  final MovieDetailsRepository _repository;
  final MovieDetailsCubit _movieDetailsCubit;
  late StreamSubscription _streamSubscription;
  VideoCubit(
    this._repository,
    this._movieDetailsCubit,
  ) : super(const VideoState.initial()) {
    _streamSubscription = _movieDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchVideos(state.id),
      );
    });
  }

  Future<void> fetchVideos(int movieId) async {
    emit(const VideoState.loading());

    final failureOrVideos = await _repository.fetchVideos(movieId);
    await failureOrVideos.fold(
      (_) async => emit(const VideoState.error()),
      (videos) async => emit(VideoState.loaded(videos: videos)),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
