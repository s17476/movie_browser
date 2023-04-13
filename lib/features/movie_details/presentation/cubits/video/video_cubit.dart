import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/video_list.dart';
import '../../../domain/repositories/movie_details_repository.dart';
import '../movie_details/movie_details_cubit.dart';
import '../tv_show_details/tv_show_details_cubit.dart';

part 'video_cubit.freezed.dart';
part 'video_state.dart';

@singleton
class VideoCubit extends Cubit<VideoState> {
  final MovieDetailsRepository _repository;
  final MovieDetailsCubit _movieDetailsCubit;
  final TvShowDetailsCubit _tvShowDetailsCubit;
  late StreamSubscription _movieStreamSubscription;
  late StreamSubscription _showStreamSubscription;
  VideoCubit(
    this._repository,
    this._movieDetailsCubit,
    this._tvShowDetailsCubit,
  ) : super(const VideoState.initial()) {
    _movieStreamSubscription = _movieDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchVideos(state.id),
      );
    });

    _showStreamSubscription = _tvShowDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchTvShowVideos(state.id),
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

  Future<void> fetchTvShowVideos(int showId) async {
    emit(const VideoState.loading());

    final failureOrVideos = await _repository.fetchTvShowVideos(showId);
    await failureOrVideos.fold(
      (_) async => emit(const VideoState.error()),
      (videos) async => emit(VideoState.loaded(videos: videos)),
    );
  }

  @override
  Future<void> close() {
    _movieStreamSubscription.cancel();
    _showStreamSubscription.cancel();
    return super.close();
  }
}
