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
import 'features/movie_details/presentation/cubits/cast/cast_cubit.dart'
    as _i30;
import 'features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart'
    as _i25;
import 'features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart'
    as _i8;
import 'features/movie_details/presentation/cubits/movie_images/movie_images_cubit.dart'
    as _i26;
import 'features/movie_details/presentation/cubits/recommendations/recommendations_cubit.dart'
    as _i28;
import 'features/movie_details/presentation/cubits/top5_movies/top20_movies_cubit.dart'
    as _i21;
import 'features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart'
    as _i23;
import 'features/movie_details/presentation/cubits/video/video_cubit.dart'
    as _i29;
import 'features/movies_list/data/repositories/movies_repository_impl.dart'
    as _i12;
import 'features/movies_list/data/services/movies_api_service_impl.dart'
    as _i10;
import 'features/movies_list/domain/repositories/movies_repository.dart'
    as _i11;
import 'features/movies_list/domain/services/movies_api_service.dart' as _i9;
import 'features/movies_list/presentation/cubits/category_movies/category_movies_cubit.dart'
    as _i24;
import 'features/movies_list/presentation/cubits/random_genres/random_genres_cubit.dart'
    as _i17;
import 'features/movies_list/presentation/cubits/search_movies/search_movies_cubit.dart'
    as _i18;
import 'features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart'
    as _i19;
import 'features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart'
    as _i20;
import 'features/movies_list/presentation/cubits/top20_tv_shows_list/top20_tv_shows_list_cubit.dart'
    as _i22;
import 'features/people/data/repositories/person_details_repository_impl.dart'
    as _i16;
import 'features/people/data/services/person_details_api_service_impl.dart'
    as _i14;
import 'features/people/domain/repositories/person_details_repository.dart'
    as _i15;
import 'features/people/domain/services/person_details_api_service.dart'
    as _i13;
import 'features/people/presentation/cubits/person_credits/person_credits_cubit.dart'
    as _i31;
import 'features/people/presentation/cubits/person_details/person_details_cubit.dart'
    as _i27;
import 'injectable_modules.dart' as _i32;

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
    gh.lazySingleton<_i13.PersonDetailsApiService>(
        () => _i14.PersonDetailsApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i15.PersonDetailsRepository>(() =>
        _i16.PersonDetailsRepositoryImpl(
            apiService: gh<_i13.PersonDetailsApiService>()));
    gh.singleton<_i17.RandomGenresCubit>(_i17.RandomGenresCubit(
      gh<_i11.MoviesRepository>(),
      gh<_i8.MovieGenresCubit>(),
    ));
    gh.factory<_i18.SearchMoviesCubit>(
        () => _i18.SearchMoviesCubit(gh<_i11.MoviesRepository>()));
    gh.factory<_i19.SearchSuggestionsCubit>(
        () => _i19.SearchSuggestionsCubit(gh<_i11.MoviesRepository>()));
    gh.singleton<_i20.Top20MovieListCubit>(
        _i20.Top20MovieListCubit(gh<_i11.MoviesRepository>()));
    gh.singleton<_i21.Top20MoviesCubit>(_i21.Top20MoviesCubit(
      gh<_i20.Top20MovieListCubit>(),
      gh<_i6.MovieDetailsRepository>(),
    ));
    gh.singleton<_i22.Top20TvShowsListCubit>(
        _i22.Top20TvShowsListCubit(gh<_i11.MoviesRepository>()));
    gh.singleton<_i23.TvShowDetailsCubit>(
        _i23.TvShowDetailsCubit(gh<_i6.MovieDetailsRepository>()));
    gh.singleton<_i24.CategoryMoviesCubit>(
        _i24.CategoryMoviesCubit(gh<_i11.MoviesRepository>()));
    gh.singleton<_i25.MovieDetailsCubit>(
        _i25.MovieDetailsCubit(gh<_i6.MovieDetailsRepository>()));
    gh.singleton<_i26.MovieImagesCubit>(_i26.MovieImagesCubit(
      gh<_i6.MovieDetailsRepository>(),
      gh<_i25.MovieDetailsCubit>(),
      gh<_i23.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i27.PersonDetailsCubit>(
        _i27.PersonDetailsCubit(gh<_i15.PersonDetailsRepository>()));
    gh.singleton<_i28.RecommendationsCubit>(_i28.RecommendationsCubit(
      gh<_i6.MovieDetailsRepository>(),
      gh<_i25.MovieDetailsCubit>(),
      gh<_i23.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i29.VideoCubit>(_i29.VideoCubit(
      gh<_i6.MovieDetailsRepository>(),
      gh<_i25.MovieDetailsCubit>(),
      gh<_i23.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i30.CastCubit>(_i30.CastCubit(
      gh<_i6.MovieDetailsRepository>(),
      gh<_i25.MovieDetailsCubit>(),
      gh<_i23.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i31.PersonCreditsCubit>(_i31.PersonCreditsCubit(
      gh<_i15.PersonDetailsRepository>(),
      gh<_i27.PersonDetailsCubit>(),
    ));
    return this;
  }
}

class _$HttpClient extends _i32.HttpClient {}
