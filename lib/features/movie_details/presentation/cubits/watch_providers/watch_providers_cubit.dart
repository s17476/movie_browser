import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movie_details/domain/entities/watch_provider.dart';
import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart';

part 'watch_providers_cubit.freezed.dart';
part 'watch_providers_state.dart';

@singleton
class WatchProvidersCubit extends Cubit<WatchProvidersState> {
  final MovieDetailsRepository repository;
  final MovieDetailsCubit movieDetailsCubit;
  final TvShowDetailsCubit tvShowDetailsCubit;

  late StreamSubscription _movieStreamSubscription;
  late StreamSubscription _showStreamSubscription;

  WatchProvidersCubit(
    this.repository,
    this.movieDetailsCubit,
    this.tvShowDetailsCubit,
  ) : super(const WatchProvidersState.initial()) {
    _movieStreamSubscription = movieDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchWatchProviders(
          state.id,
          false,
        ),
      );
    });

    _showStreamSubscription = tvShowDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchWatchProviders(state.id, true),
      );
    });
  }

  Future<void> fetchWatchProviders(
    int movieId,
    bool isTvShow,
  ) async {
    emit(const WatchProvidersState.loading());

    final failureOrImages =
        await repository.fetchWatchProviders(movieId, isTvShow);

    await failureOrImages.fold(
      (_) async => emit(const WatchProvidersState.error()),
      (watchProviders) async {
        emit(
          WatchProvidersState.loaded(
            id: movieId,
            providers: watchProviders,
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
