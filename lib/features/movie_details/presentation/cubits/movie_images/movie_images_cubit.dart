import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart';

part 'movie_images_cubit.freezed.dart';
part 'movie_images_state.dart';

@singleton
class MovieImagesCubit extends Cubit<MovieImagesState> {
  final MovieDetailsRepository _repository;
  final MovieDetailsCubit _movieDetailsCubit;
  final TvShowDetailsCubit _tvShowDetailsCubit;
  late StreamSubscription _movieStreamSubscription;
  late StreamSubscription _showStreamSubscription;

  MovieImagesCubit(
    this._repository,
    this._movieDetailsCubit,
    this._tvShowDetailsCubit,
  ) : super(const MovieImagesState.initial()) {
    _movieStreamSubscription = _movieDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchMovieImages(
          state.id,
          state.movie.posterPath,
          false,
        ),
      );
    });

    _showStreamSubscription = _tvShowDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) =>
            fetchMovieImages(state.id, state.tvShow.posterPath ?? '', true),
      );
    });
  }

  Future<void> fetchMovieImages(
    int movieId,
    String posterUrl,
    bool isTvShow,
  ) async {
    emit(const MovieImagesState.lodaing());

    final failureOrImages =
        await _repository.fetchMovieImages(movieId, isTvShow);
    await failureOrImages.fold(
      (_) async => emit(const MovieImagesState.error()),
      (images) async {
        List<String> urls = [];
        if (posterUrl.isNotEmpty) {
          urls.add(posterUrl);
        }
        urls.addAll(images.backdrops.map((img) => img.filePath).toList());

        emit(
          MovieImagesState.loaded(
            id: movieId,
            images: urls,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _movieStreamSubscription.cancel();
    _showStreamSubscription.cancel();
    return super.close();
  }
}
