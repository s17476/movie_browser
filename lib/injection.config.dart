// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'features/movie_details/data/repositories/movie_details_repository_impl.dart'
    as _i7;
import 'features/movie_details/data/services/movie_details_api_service_impl.dart'
    as _i5;
import 'features/movie_details/domain/repositories/movie_details_repository.dart'
    as _i6;
import 'features/movie_details/domain/services/movie_details_api_service.dart'
    as _i4;
import 'features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart'
    as _i8;
import 'features/movie_details/presentation/cubits/top5_movies/top20_movies_cubit.dart'
    as _i17;
import 'features/movies_list/data/repositories/movies_repository_impl.dart'
    as _i12;
import 'features/movies_list/data/services/movies_api_service_impl.dart'
    as _i10;
import 'features/movies_list/domain/repositories/movies_repository.dart'
    as _i11;
import 'features/movies_list/domain/services/movies_api_service.dart' as _i9;
import 'features/movies_list/presentation/cubits/random_genres/random_genres_cubit.dart'
    as _i13;
import 'features/movies_list/presentation/cubits/search_movies/search_movies_cubit.dart'
    as _i14;
import 'features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart'
    as _i15;
import 'features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart'
    as _i16;
import 'features/movies_list/presentation/cubits/top20_tv_shows_list/top20_tv_shows_list_cubit.dart'
    as _i18;
import 'injectable_modules.dart' as _i19;

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
    final httpClient = _$HttpClient();
    gh.lazySingleton<_i3.Client>(() => httpClient.httpClient);
    gh.lazySingleton<_i4.MovieDetailsApiService>(
        () => _i5.MovieDetailsApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i6.MovieDetailsRepository>(() =>
        _i7.MovieDetailsRepositoryImpl(
            apiService: gh<_i4.MovieDetailsApiService>()));
    gh.singleton<_i8.MovieGenresCubit>(
        _i8.MovieGenresCubit(gh<_i6.MovieDetailsRepository>()));
    gh.lazySingleton<_i9.MoviesApiService>(
        () => _i10.MoviesApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i11.MoviesRepository>(() =>
        _i12.MoviesRepositoryImpl(apiService: gh<_i9.MoviesApiService>()));
    gh.singleton<_i13.RandomGenresCubit>(_i13.RandomGenresCubit(
      gh<_i11.MoviesRepository>(),
      gh<_i8.MovieGenresCubit>(),
    ));
    gh.factory<_i14.SearchMoviesCubit>(
        () => _i14.SearchMoviesCubit(gh<_i11.MoviesRepository>()));
    gh.factory<_i15.SearchSuggestionsCubit>(
        () => _i15.SearchSuggestionsCubit(gh<_i11.MoviesRepository>()));
    gh.singleton<_i16.Top20MovieListCubit>(
        _i16.Top20MovieListCubit(gh<_i11.MoviesRepository>()));
    gh.singleton<_i17.Top20MoviesCubit>(_i17.Top20MoviesCubit(
      gh<_i16.Top20MovieListCubit>(),
      gh<_i6.MovieDetailsRepository>(),
    ));
    gh.singleton<_i18.Top20TvShowsListCubit>(
        _i18.Top20TvShowsListCubit(gh<_i11.MoviesRepository>()));
    return this;
  }
}

class _$HttpClient extends _i19.HttpClient {}
