import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movie_details/domain/entities/video_list.dart';
import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart';

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
        loaded: (state) => fetchVideos(state.id, false),
      );
    });

    _showStreamSubscription = _tvShowDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchVideos(state.id, true),
      );
    });
  }

  Future<void> fetchVideos(int movieId, bool isTvShow) async {
    emit(const VideoState.loading());

    final failureOrVideos = await _repository.fetchVideos(movieId, isTvShow);
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
