// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'features/auth/data/repositories/authentication_repository_impl.dart'
    as _i26;
import 'features/auth/domain/repositories/auth_repository.dart' as _i25;
import 'features/auth/presentation/blocs/bloc/auth_bloc_bloc.dart' as _i34;
import 'features/auth/presentation/cubits/email_provider/email_provider_cubit.dart'
    as _i28;
import 'features/movie_details/data/repositories/movie_details_repository_impl.dart'
    as _i8;
import 'features/movie_details/data/services/movie_details_api_service_impl.dart'
    as _i6;
import 'features/movie_details/domain/repositories/movie_details_repository.dart'
    as _i7;
import 'features/movie_details/domain/services/movie_details_api_service.dart'
    as _i5;
import 'features/movie_details/presentation/cubits/cast/cast_cubit.dart'
    as _i35;
import 'features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart'
    as _i29;
import 'features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart'
    as _i9;
import 'features/movie_details/presentation/cubits/movie_images/movie_images_cubit.dart'
    as _i30;
import 'features/movie_details/presentation/cubits/recommendations/recommendations_cubit.dart'
    as _i32;
import 'features/movie_details/presentation/cubits/top5_movies/top20_movies_cubit.dart'
    as _i22;
import 'features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart'
    as _i24;
import 'features/movie_details/presentation/cubits/video/video_cubit.dart'
    as _i33;
import 'features/movies_list/data/repositories/movies_repository_impl.dart'
    as _i13;
import 'features/movies_list/data/services/movies_api_service_impl.dart'
    as _i11;
import 'features/movies_list/domain/repositories/movies_repository.dart'
    as _i12;
import 'features/movies_list/domain/services/movies_api_service.dart' as _i10;
import 'features/movies_list/presentation/cubits/category_movies/category_movies_cubit.dart'
    as _i27;
import 'features/movies_list/presentation/cubits/random_genres/random_genres_cubit.dart'
    as _i18;
import 'features/movies_list/presentation/cubits/search_movies/search_movies_cubit.dart'
    as _i19;
import 'features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart'
    as _i20;
import 'features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart'
    as _i21;
import 'features/movies_list/presentation/cubits/top20_tv_shows_list/top20_tv_shows_list_cubit.dart'
    as _i23;
import 'features/people/data/repositories/person_details_repository_impl.dart'
    as _i17;
import 'features/people/data/services/person_details_api_service_impl.dart'
    as _i15;
import 'features/people/domain/repositories/person_details_repository.dart'
    as _i16;
import 'features/people/domain/services/person_details_api_service.dart'
    as _i14;
import 'features/people/presentation/cubits/person_credits/person_credits_cubit.dart'
    as _i36;
import 'features/people/presentation/cubits/person_details/person_details_cubit.dart'
    as _i31;
import 'injectable_modules.dart' as _i37;

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
    final firebaseAuthenticationService = _$FirebaseAuthenticationService();
    gh.lazySingleton<_i3.Client>(() => httpClient.httpClient);
    gh.lazySingleton<_i4.FirebaseAuth>(
        () => firebaseAuthenticationService.firebaseAuth);
    gh.lazySingleton<_i5.MovieDetailsApiService>(
        () => _i6.MovieDetailsApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i7.MovieDetailsRepository>(() =>
        _i8.MovieDetailsRepositoryImpl(
            apiService: gh<_i5.MovieDetailsApiService>()));
    gh.singleton<_i9.MovieGenresCubit>(
        _i9.MovieGenresCubit(gh<_i7.MovieDetailsRepository>()));
    gh.lazySingleton<_i10.MoviesApiService>(
        () => _i11.MoviesApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i12.MoviesRepository>(() =>
        _i13.MoviesRepositoryImpl(apiService: gh<_i10.MoviesApiService>()));
    gh.lazySingleton<_i14.PersonDetailsApiService>(
        () => _i15.PersonDetailsApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i16.PersonDetailsRepository>(() =>
        _i17.PersonDetailsRepositoryImpl(
            apiService: gh<_i14.PersonDetailsApiService>()));
    gh.singleton<_i18.RandomGenresCubit>(_i18.RandomGenresCubit(
      gh<_i12.MoviesRepository>(),
      gh<_i9.MovieGenresCubit>(),
    ));
    gh.factory<_i19.SearchMoviesCubit>(
        () => _i19.SearchMoviesCubit(gh<_i12.MoviesRepository>()));
    gh.factory<_i20.SearchSuggestionsCubit>(
        () => _i20.SearchSuggestionsCubit(gh<_i12.MoviesRepository>()));
    gh.singleton<_i21.Top20MovieListCubit>(
        _i21.Top20MovieListCubit(gh<_i12.MoviesRepository>()));
    gh.singleton<_i22.Top20MoviesCubit>(_i22.Top20MoviesCubit(
      gh<_i21.Top20MovieListCubit>(),
      gh<_i7.MovieDetailsRepository>(),
    ));
    gh.singleton<_i23.Top20TvShowsListCubit>(
        _i23.Top20TvShowsListCubit(gh<_i12.MoviesRepository>()));
    gh.singleton<_i24.TvShowDetailsCubit>(
        _i24.TvShowDetailsCubit(gh<_i7.MovieDetailsRepository>()));
    gh.lazySingleton<_i25.AuthRepository>(
        () => _i26.AuthenticationRepositoryImpl(gh<_i4.FirebaseAuth>()));
    gh.singleton<_i27.CategoryMoviesCubit>(
        _i27.CategoryMoviesCubit(gh<_i12.MoviesRepository>()));
    gh.factory<_i28.EmailProviderCubit>(
        () => _i28.EmailProviderCubit(gh<_i25.AuthRepository>()));
    gh.singleton<_i29.MovieDetailsCubit>(
        _i29.MovieDetailsCubit(gh<_i7.MovieDetailsRepository>()));
    gh.singleton<_i30.MovieImagesCubit>(_i30.MovieImagesCubit(
      gh<_i7.MovieDetailsRepository>(),
      gh<_i29.MovieDetailsCubit>(),
      gh<_i24.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i31.PersonDetailsCubit>(
        _i31.PersonDetailsCubit(gh<_i16.PersonDetailsRepository>()));
    gh.singleton<_i32.RecommendationsCubit>(_i32.RecommendationsCubit(
      gh<_i7.MovieDetailsRepository>(),
      gh<_i29.MovieDetailsCubit>(),
      gh<_i24.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i33.VideoCubit>(_i33.VideoCubit(
      gh<_i7.MovieDetailsRepository>(),
      gh<_i29.MovieDetailsCubit>(),
      gh<_i24.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i34.AuthBlocBloc>(
        _i34.AuthBlocBloc(gh<_i25.AuthRepository>()));
    gh.singleton<_i35.CastCubit>(_i35.CastCubit(
      gh<_i7.MovieDetailsRepository>(),
      gh<_i29.MovieDetailsCubit>(),
      gh<_i24.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i36.PersonCreditsCubit>(_i36.PersonCreditsCubit(
      gh<_i16.PersonDetailsRepository>(),
      gh<_i31.PersonDetailsCubit>(),
    ));
    return this;
  }
}

class _$HttpClient extends _i37.HttpClient {}

class _$FirebaseAuthenticationService
    extends _i37.FirebaseAuthenticationService {}
