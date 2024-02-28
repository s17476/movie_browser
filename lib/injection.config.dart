// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'features/auth/data/repositories/authentication_repository_impl.dart'
    as _i34;
import 'features/auth/domain/repositories/auth_repository.dart' as _i33;
import 'features/auth/presentation/blocs/auth/auth_bloc.dart' as _i46;
import 'features/auth/presentation/cubits/apple_provider/apple_provider_cubit.dart'
    as _i45;
import 'features/auth/presentation/cubits/email_provider/email_provider_cubit.dart'
    as _i36;
import 'features/auth/presentation/cubits/facebook_provider/facebook_provider_cubit.dart'
    as _i37;
import 'features/auth/presentation/cubits/google_provider/google_provider_cubit.dart'
    as _i38;
import 'features/core/presentation/cubits/current_route/current_route_cubit.dart'
    as _i4;
import 'features/movie_details/data/repositories/movie_details_repository_impl.dart'
    as _i12;
import 'features/movie_details/data/services/movie_details_api_service_impl.dart'
    as _i10;
import 'features/movie_details/domain/repositories/movie_details_repository.dart'
    as _i11;
import 'features/movie_details/domain/services/movie_details_api_service.dart'
    as _i9;
import 'features/movie_details/presentation/cubits/cast/cast_cubit.dart'
    as _i47;
import 'features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart'
    as _i39;
import 'features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart'
    as _i13;
import 'features/movie_details/presentation/cubits/movie_images/movie_images_cubit.dart'
    as _i40;
import 'features/movie_details/presentation/cubits/recommendations/recommendations_cubit.dart'
    as _i42;
import 'features/movie_details/presentation/cubits/top5_movies/top20_movies_cubit.dart'
    as _i30;
import 'features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart'
    as _i32;
import 'features/movie_details/presentation/cubits/video/video_cubit.dart'
    as _i43;
import 'features/movie_details/presentation/cubits/watch_providers/watch_providers_cubit.dart'
    as _i44;
import 'features/movies_list/data/repositories/movies_repository_impl.dart'
    as _i17;
import 'features/movies_list/data/services/movies_api_service_impl.dart'
    as _i15;
import 'features/movies_list/domain/repositories/movies_repository.dart'
    as _i16;
import 'features/movies_list/domain/services/movies_api_service.dart' as _i14;
import 'features/movies_list/presentation/cubits/category_movies/category_movies_cubit.dart'
    as _i35;
import 'features/movies_list/presentation/cubits/random_genres/random_genres_cubit.dart'
    as _i26;
import 'features/movies_list/presentation/cubits/search_movies/search_movies_cubit.dart'
    as _i27;
import 'features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart'
    as _i28;
import 'features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart'
    as _i29;
import 'features/movies_list/presentation/cubits/top20_tv_shows_list/top20_tv_shows_list_cubit.dart'
    as _i31;
import 'features/people/data/repositories/person_details_repository_impl.dart'
    as _i21;
import 'features/people/data/services/person_details_api_service_impl.dart'
    as _i19;
import 'features/people/domain/repositories/person_details_repository.dart'
    as _i20;
import 'features/people/domain/services/person_details_api_service.dart'
    as _i18;
import 'features/people/presentation/cubits/person_credits/person_credits_cubit.dart'
    as _i48;
import 'features/people/presentation/cubits/person_details/person_details_cubit.dart'
    as _i41;
import 'features/profile/data/repositories/profile_repository_impl.dart'
    as _i25;
import 'features/profile/data/services/profile_api_service_impl.dart' as _i23;
import 'features/profile/domain/repositories/profile_repository.dart' as _i24;
import 'features/profile/domain/services/profile_api_service.dart' as _i22;
import 'features/profile/presentation/cubits/user_lists/user_lists_cubit.dart'
    as _i50;
import 'features/profile/presentation/cubits/user_profile/user_profile_cubit.dart'
    as _i49;
import 'injectable_modules.dart' as _i51;

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
    final facebookSignInService = _$FacebookSignInService();
    final firebaseAuthenticationService = _$FirebaseAuthenticationService();
    final firebaseFirestoreService = _$FirebaseFirestoreService();
    final googleSignInService = _$GoogleSignInService();
    gh.lazySingleton<_i3.Client>(() => httpClient.httpClient);
    gh.singleton<_i4.CurrentRouteCubit>(_i4.CurrentRouteCubit());
    gh.lazySingleton<_i5.FacebookAuth>(
        () => facebookSignInService.facebookSignIn);
    gh.lazySingleton<_i6.FirebaseAuth>(
        () => firebaseAuthenticationService.firebaseAuth);
    gh.lazySingleton<_i7.FirebaseFirestore>(
        () => firebaseFirestoreService.firebaseFirestore);
    gh.lazySingleton<_i8.GoogleSignIn>(() => googleSignInService.googleSignIn);
    gh.lazySingleton<_i9.MovieDetailsApiService>(
        () => _i10.MovieDetailsApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i11.MovieDetailsRepository>(() =>
        _i12.MovieDetailsRepositoryImpl(
            apiService: gh<_i9.MovieDetailsApiService>()));
    gh.singleton<_i13.MovieGenresCubit>(
        _i13.MovieGenresCubit(gh<_i11.MovieDetailsRepository>()));
    gh.lazySingleton<_i14.MoviesApiService>(
        () => _i15.MoviesApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i16.MoviesRepository>(() =>
        _i17.MoviesRepositoryImpl(apiService: gh<_i14.MoviesApiService>()));
    gh.lazySingleton<_i18.PersonDetailsApiService>(
        () => _i19.PersonDetailsApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i20.PersonDetailsRepository>(() =>
        _i21.PersonDetailsRepositoryImpl(
            apiService: gh<_i18.PersonDetailsApiService>()));
    gh.lazySingleton<_i22.ProfileApiService>(
        () => _i23.ProfileApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i24.ProfileRepository>(() => _i25.ProfileRepositoryImpl(
          gh<_i22.ProfileApiService>(),
          gh<_i7.FirebaseFirestore>(),
        ));
    gh.singleton<_i26.RandomGenresCubit>(_i26.RandomGenresCubit(
      gh<_i16.MoviesRepository>(),
      gh<_i13.MovieGenresCubit>(),
    ));
    gh.factory<_i27.SearchMoviesCubit>(
        () => _i27.SearchMoviesCubit(gh<_i16.MoviesRepository>()));
    gh.factory<_i28.SearchSuggestionsCubit>(
        () => _i28.SearchSuggestionsCubit(gh<_i16.MoviesRepository>()));
    gh.singleton<_i29.Top20MovieListCubit>(
        _i29.Top20MovieListCubit(gh<_i16.MoviesRepository>()));
    gh.singleton<_i30.Top20MoviesCubit>(_i30.Top20MoviesCubit(
      gh<_i29.Top20MovieListCubit>(),
      gh<_i11.MovieDetailsRepository>(),
    ));
    gh.singleton<_i31.Top20TvShowsListCubit>(
        _i31.Top20TvShowsListCubit(gh<_i16.MoviesRepository>()));
    gh.singleton<_i32.TvShowDetailsCubit>(
        _i32.TvShowDetailsCubit(gh<_i11.MovieDetailsRepository>()));
    gh.lazySingleton<_i33.AuthRepository>(
        () => _i34.AuthenticationRepositoryImpl(
              gh<_i6.FirebaseAuth>(),
              gh<_i8.GoogleSignIn>(),
              gh<_i5.FacebookAuth>(),
              gh<_i7.FirebaseFirestore>(),
            ));
    gh.singleton<_i35.CategoryMoviesCubit>(
        _i35.CategoryMoviesCubit(gh<_i16.MoviesRepository>()));
    gh.factory<_i36.EmailProviderCubit>(
        () => _i36.EmailProviderCubit(gh<_i33.AuthRepository>()));
    gh.factory<_i37.FacebookProviderCubit>(
        () => _i37.FacebookProviderCubit(gh<_i33.AuthRepository>()));
    gh.factory<_i38.GoogleProviderCubit>(
        () => _i38.GoogleProviderCubit(gh<_i33.AuthRepository>()));
    gh.singleton<_i39.MovieDetailsCubit>(
        _i39.MovieDetailsCubit(gh<_i11.MovieDetailsRepository>()));
    gh.singleton<_i40.MovieImagesCubit>(_i40.MovieImagesCubit(
      gh<_i11.MovieDetailsRepository>(),
      gh<_i39.MovieDetailsCubit>(),
      gh<_i32.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i41.PersonDetailsCubit>(
        _i41.PersonDetailsCubit(gh<_i20.PersonDetailsRepository>()));
    gh.singleton<_i42.RecommendationsCubit>(_i42.RecommendationsCubit(
      gh<_i11.MovieDetailsRepository>(),
      gh<_i39.MovieDetailsCubit>(),
      gh<_i32.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i43.VideoCubit>(_i43.VideoCubit(
      gh<_i11.MovieDetailsRepository>(),
      gh<_i39.MovieDetailsCubit>(),
      gh<_i32.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i44.WatchProvidersCubit>(_i44.WatchProvidersCubit(
      gh<_i11.MovieDetailsRepository>(),
      gh<_i39.MovieDetailsCubit>(),
      gh<_i32.TvShowDetailsCubit>(),
    ));
    gh.factory<_i45.AppleProviderCubit>(
        () => _i45.AppleProviderCubit(gh<_i33.AuthRepository>()));
    gh.singleton<_i46.AuthBloc>(_i46.AuthBloc(gh<_i33.AuthRepository>()));
    gh.singleton<_i47.CastCubit>(_i47.CastCubit(
      gh<_i11.MovieDetailsRepository>(),
      gh<_i39.MovieDetailsCubit>(),
      gh<_i32.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i48.PersonCreditsCubit>(_i48.PersonCreditsCubit(
      gh<_i20.PersonDetailsRepository>(),
      gh<_i41.PersonDetailsCubit>(),
    ));
    gh.singleton<_i49.UserProfileCubit>(_i49.UserProfileCubit(
      gh<_i24.ProfileRepository>(),
      gh<_i46.AuthBloc>(),
    ));
    gh.singleton<_i50.UserListsCubit>(_i50.UserListsCubit(
      gh<_i49.UserProfileCubit>(),
      gh<_i11.MovieDetailsRepository>(),
    ));
    return this;
  }
}

class _$HttpClient extends _i51.HttpClient {}

class _$FacebookSignInService extends _i51.FacebookSignInService {}

class _$FirebaseAuthenticationService
    extends _i51.FirebaseAuthenticationService {}

class _$FirebaseFirestoreService extends _i51.FirebaseFirestoreService {}

class _$GoogleSignInService extends _i51.GoogleSignInService {}
