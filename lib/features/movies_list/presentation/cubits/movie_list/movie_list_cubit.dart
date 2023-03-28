import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';

import '../../../../core/errors/failure.dart';

part 'movie_list_state.dart';
part 'movie_list_cubit.freezed.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit() : super(MovieListState.initial());
}
