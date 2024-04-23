import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movie_details/domain/entities/tv_show_details.dart';
import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';

part 'tv_show_details_cubit.freezed.dart';
part 'tv_show_details_state.dart';

@singleton
class TvShowDetailsCubit extends Cubit<TvShowDetailsState> {
  final MovieDetailsRepository repository;

  TvShowDetailsCubit(
    this.repository,
  ) : super(const TvShowDetailsState.initial());

  Future<void> fetchTvShowDetails(int showId) async {
    emit(const TvShowDetailsState.loading());

    final failureOrShowDetails = await repository.fetchTvShowDetails(showId);
    await failureOrShowDetails.fold(
      (_) async => emit(const TvShowDetailsState.error()),
      (tvShow) async => emit(
        TvShowDetailsState.loaded(
          id: showId,
          tvShow: tvShow,
        ),
      ),
    );
  }
}
