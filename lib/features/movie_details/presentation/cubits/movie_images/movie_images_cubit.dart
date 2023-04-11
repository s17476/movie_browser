import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/movie_details_repository.dart';
import '../movie_details/movie_details_cubit.dart';

part 'movie_images_cubit.freezed.dart';
part 'movie_images_state.dart';

@singleton
class MovieImagesCubit extends Cubit<MovieImagesState> {
  final MovieDetailsRepository _repository;
  final MovieDetailsCubit _movieDetailsCubit;
  late StreamSubscription _streamSubscription;

  MovieImagesCubit(
    this._repository,
    this._movieDetailsCubit,
  ) : super(const MovieImagesState.initial()) {
    _streamSubscription = _movieDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchImages(state.id, state.movie.posterPath),
      );
    });
  }

  Future<void> fetchImages(int movieId, String posterUrl) async {
    emit(const MovieImagesState.lodaing());

    final failureOrImages = await _repository.fetchMovieImages(movieId);
    await failureOrImages.fold(
      (_) async => emit(const MovieImagesState.error()),
      (images) async {
        List<String> urls = [];
        if (posterUrl.isNotEmpty) {
          urls.add(posterUrl);
        }
        urls.addAll(images.backdrops.map((img) => img.filePath).toList());
        // urls.addAll(images.posters.map((img) => img.filePath).toList());

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
    _streamSubscription.cancel();
    return super.close();
  }
}
