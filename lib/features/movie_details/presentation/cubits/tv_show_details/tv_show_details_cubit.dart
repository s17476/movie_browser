import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/tv_show_details.dart';
import '../../../domain/repositories/movie_details_repository.dart';

part 'tv_show_details_cubit.freezed.dart';
part 'tv_show_details_state.dart';

@singleton
class TvShowDetailsCubit extends Cubit<TvShowDetailsState> {
  final MovieDetailsRepository _repository;

  TvShowDetailsCubit(
    this._repository,
  ) : super(const TvShowDetailsState.initial());

  Future<void> fetchTvShowDetails(int showId) async {
    emit(const TvShowDetailsState.loading());

    final failureOrShowDetails = await _repository.fetchTvShowDetails(showId);
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
