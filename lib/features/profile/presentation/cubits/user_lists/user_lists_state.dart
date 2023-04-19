part of 'user_lists_cubit.dart';

@freezed
class UserListsState with _$UserListsState {
  const factory UserListsState.initial() = _Initial;
  const factory UserListsState.error() = _Error;
  const factory UserListsState.loading() = _Loading;
  const factory UserListsState.loaded({
    required List<MovieDetails> movies,
    required List<TvShowDetails> shows,
    required ListType listType,
  }) = _Loaded;
}
