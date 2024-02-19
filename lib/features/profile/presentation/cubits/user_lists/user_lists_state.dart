part of 'user_lists_cubit.dart';

@freezed
sealed class UserListsState with _$UserListsState {
  const factory UserListsState.initial() = Initial;
  const factory UserListsState.error() = Error;
  const factory UserListsState.loading() = Loading;
  const factory UserListsState.loaded({
    required List<MovieDetails> movies,
    required List<TvShowDetails> shows,
    required ListType listType,
  }) = Loaded;
}
