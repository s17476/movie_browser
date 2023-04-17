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
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'features/auth/data/repositories/authentication_repository_impl.dart'
    as _i27;
import 'features/auth/domain/repositories/auth_repository.dart' as _i26;
import 'features/auth/presentation/blocs/auth/auth_bloc.dart' as _i37;
import 'features/auth/presentation/cubits/apple_provider/apple_provider_cubit.dart'
    as _i36;
import 'features/auth/presentation/cubits/email_provider/email_provider_cubit.dart'
    as _i29;
import 'features/auth/presentation/cubits/google_provider/google_provider_cubit.dart'
    as _i30;
import 'features/movie_details/data/repositories/movie_details_repository_impl.dart'
    as _i9;
import 'features/movie_details/data/services/movie_details_api_service_impl.dart'
    as _i7;
import 'features/movie_details/domain/repositories/movie_details_repository.dart'
    as _i8;
import 'features/movie_details/domain/services/movie_details_api_service.dart'
    as _i6;
import 'features/movie_details/presentation/cubits/cast/cast_cubit.dart'
    as _i38;
import 'features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart'
    as _i31;
import 'features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart'
    as _i10;
import 'features/movie_details/presentation/cubits/movie_images/movie_images_cubit.dart'
    as _i32;
import 'features/movie_details/presentation/cubits/recommendations/recommendations_cubit.dart'
    as _i34;
import 'features/movie_details/presentation/cubits/top5_movies/top20_movies_cubit.dart'
    as _i23;
import 'features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart'
    as _i25;
import 'features/movie_details/presentation/cubits/video/video_cubit.dart'
    as _i35;
import 'features/movies_list/data/repositories/movies_repository_impl.dart'
    as _i14;
import 'features/movies_list/data/services/movies_api_service_impl.dart'
    as _i12;
import 'features/movies_list/domain/repositories/movies_repository.dart'
    as _i13;
import 'features/movies_list/domain/services/movies_api_service.dart' as _i11;
import 'features/movies_list/presentation/cubits/category_movies/category_movies_cubit.dart'
    as _i28;
import 'features/movies_list/presentation/cubits/random_genres/random_genres_cubit.dart'
    as _i19;
import 'features/movies_list/presentation/cubits/search_movies/search_movies_cubit.dart'
    as _i20;
import 'features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart'
    as _i21;
import 'features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart'
    as _i22;
import 'features/movies_list/presentation/cubits/top20_tv_shows_list/top20_tv_shows_list_cubit.dart'
    as _i24;
import 'features/people/data/repositories/person_details_repository_impl.dart'
    as _i18;
import 'features/people/data/services/person_details_api_service_impl.dart'
    as _i16;
import 'features/people/domain/repositories/person_details_repository.dart'
    as _i17;
import 'features/people/domain/services/person_details_api_service.dart'
    as _i15;
import 'features/people/presentation/cubits/person_credits/person_credits_cubit.dart'
    as _i39;
import 'features/people/presentation/cubits/person_details/person_details_cubit.dart'
    as _i33;
import 'injectable_modules.dart' as _i40;

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
    final googleSignInService = _$GoogleSignInService();
    gh.lazySingleton<_i3.Client>(() => httpClient.httpClient);
    gh.lazySingleton<_i4.FirebaseAuth>(
        () => firebaseAuthenticationService.firebaseAuth);
    gh.lazySingleton<_i5.GoogleSignIn>(() => googleSignInService.googleSignIn);
    gh.lazySingleton<_i6.MovieDetailsApiService>(
        () => _i7.MovieDetailsApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i8.MovieDetailsRepository>(() =>
        _i9.MovieDetailsRepositoryImpl(
            apiService: gh<_i6.MovieDetailsApiService>()));
    gh.singleton<_i10.MovieGenresCubit>(
        _i10.MovieGenresCubit(gh<_i8.MovieDetailsRepository>()));
    gh.lazySingleton<_i11.MoviesApiService>(
        () => _i12.MoviesApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i13.MoviesRepository>(() =>
        _i14.MoviesRepositoryImpl(apiService: gh<_i11.MoviesApiService>()));
    gh.lazySingleton<_i15.PersonDetailsApiService>(
        () => _i16.PersonDetailsApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i17.PersonDetailsRepository>(() =>
        _i18.PersonDetailsRepositoryImpl(
            apiService: gh<_i15.PersonDetailsApiService>()));
    gh.singleton<_i19.RandomGenresCubit>(_i19.RandomGenresCubit(
      gh<_i13.MoviesRepository>(),
      gh<_i10.MovieGenresCubit>(),
    ));
    gh.factory<_i20.SearchMoviesCubit>(
        () => _i20.SearchMoviesCubit(gh<_i13.MoviesRepository>()));
    gh.factory<_i21.SearchSuggestionsCubit>(
        () => _i21.SearchSuggestionsCubit(gh<_i13.MoviesRepository>()));
    gh.singleton<_i22.Top20MovieListCubit>(
        _i22.Top20MovieListCubit(gh<_i13.MoviesRepository>()));
    gh.singleton<_i23.Top20MoviesCubit>(_i23.Top20MoviesCubit(
      gh<_i22.Top20MovieListCubit>(),
      gh<_i8.MovieDetailsRepository>(),
    ));
    gh.singleton<_i24.Top20TvShowsListCubit>(
        _i24.Top20TvShowsListCubit(gh<_i13.MoviesRepository>()));
    gh.singleton<_i25.TvShowDetailsCubit>(
        _i25.TvShowDetailsCubit(gh<_i8.MovieDetailsRepository>()));
    gh.lazySingleton<_i26.AuthRepository>(
        () => _i27.AuthenticationRepositoryImpl(
              gh<_i4.FirebaseAuth>(),
              gh<_i5.GoogleSignIn>(),
            ));
    gh.singleton<_i28.CategoryMoviesCubit>(
        _i28.CategoryMoviesCubit(gh<_i13.MoviesRepository>()));
    gh.factory<_i29.EmailProviderCubit>(
        () => _i29.EmailProviderCubit(gh<_i26.AuthRepository>()));
    gh.factory<_i30.GoogleProviderCubit>(
        () => _i30.GoogleProviderCubit(gh<_i26.AuthRepository>()));
    gh.singleton<_i31.MovieDetailsCubit>(
        _i31.MovieDetailsCubit(gh<_i8.MovieDetailsRepository>()));
    gh.singleton<_i32.MovieImagesCubit>(_i32.MovieImagesCubit(
      gh<_i8.MovieDetailsRepository>(),
      gh<_i31.MovieDetailsCubit>(),
      gh<_i25.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i33.PersonDetailsCubit>(
        _i33.PersonDetailsCubit(gh<_i17.PersonDetailsRepository>()));
    gh.singleton<_i34.RecommendationsCubit>(_i34.RecommendationsCubit(
      gh<_i8.MovieDetailsRepository>(),
      gh<_i31.MovieDetailsCubit>(),
      gh<_i25.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i35.VideoCubit>(_i35.VideoCubit(
      gh<_i8.MovieDetailsRepository>(),
      gh<_i31.MovieDetailsCubit>(),
      gh<_i25.TvShowDetailsCubit>(),
    ));
    gh.factory<_i36.AppleProviderCubit>(
        () => _i36.AppleProviderCubit(gh<_i26.AuthRepository>()));
    gh.singleton<_i37.AuthBloc>(_i37.AuthBloc(gh<_i26.AuthRepository>()));
    gh.singleton<_i38.CastCubit>(_i38.CastCubit(
      gh<_i8.MovieDetailsRepository>(),
      gh<_i31.MovieDetailsCubit>(),
      gh<_i25.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i39.PersonCreditsCubit>(_i39.PersonCreditsCubit(
      gh<_i17.PersonDetailsRepository>(),
      gh<_i33.PersonDetailsCubit>(),
    ));
    return this;
  }
}

class _$HttpClient extends _i40.HttpClient {}

class _$FirebaseAuthenticationService
    extends _i40.FirebaseAuthenticationService {}

class _$GoogleSignInService extends _i40.GoogleSignInService {}
