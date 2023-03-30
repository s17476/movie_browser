// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/movie_details/data/repositories/movie_details_repository_impl.dart'
    as _i6;
import 'features/movie_details/data/services/movie_details_api_service_impl.dart'
    as _i4;
import 'features/movie_details/domain/repositories/movie_details_repository.dart'
    as _i5;
import 'features/movie_details/domain/services/movie_details_api_service.dart'
    as _i3;
import 'features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart'
    as _i7;
import 'features/movie_details/presentation/cubits/top5_movies/top20_movies_cubit.dart'
    as _i15;
import 'features/movies_list/data/repositories/movies_repository_impl.dart'
    as _i11;
import 'features/movies_list/data/services/movies_api_service_impl.dart' as _i9;
import 'features/movies_list/domain/repositories/movies_repository.dart'
    as _i10;
import 'features/movies_list/domain/services/movies_api_service.dart' as _i8;
import 'features/movies_list/presentation/cubits/random_genres/random_genres_cubit.dart'
    as _i12;
import 'features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart'
    as _i13;
import 'features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart'
    as _i14;
import 'features/movies_list/presentation/cubits/top20_tv_shows_list/top20_tv_shows_list_cubit.dart'
    as _i16;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.MovieDetailsApiService>(
        () => _i4.MovieDetailsApiServiceImpl());
    gh.lazySingleton<_i5.MovieDetailsRepository>(() =>
        _i6.MovieDetailsRepositoryImpl(
            apiService: gh<_i3.MovieDetailsApiService>()));
    gh.singleton<_i7.MovieGenresCubit>(
        _i7.MovieGenresCubit(gh<_i5.MovieDetailsRepository>()));
    gh.lazySingleton<_i8.MoviesApiService>(() => _i9.MoviesApiServiceImpl());
    gh.lazySingleton<_i10.MoviesRepository>(() =>
        _i11.MoviesRepositoryImpl(apiService: gh<_i8.MoviesApiService>()));
    gh.singleton<_i12.RandomGenresCubit>(_i12.RandomGenresCubit(
      gh<_i10.MoviesRepository>(),
      gh<_i7.MovieGenresCubit>(),
    ));
    gh.factory<_i13.SearchSuggestionsCubit>(
        () => _i13.SearchSuggestionsCubit(gh<_i10.MoviesRepository>()));
    gh.singleton<_i14.Top20MovieListCubit>(
        _i14.Top20MovieListCubit(gh<_i10.MoviesRepository>()));
    gh.singleton<_i15.Top20MoviesCubit>(_i15.Top20MoviesCubit(
      gh<_i14.Top20MovieListCubit>(),
      gh<_i5.MovieDetailsRepository>(),
    ));
    gh.singleton<_i16.Top20TvShowsListCubit>(
        _i16.Top20TvShowsListCubit(gh<_i10.MoviesRepository>()));
    return this;
  }
}
