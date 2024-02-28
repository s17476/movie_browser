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
    as _i35;
import 'features/auth/domain/repositories/auth_repository.dart' as _i34;
import 'features/auth/presentation/blocs/auth/auth_bloc.dart' as _i47;
import 'features/auth/presentation/cubits/apple_provider/apple_provider_cubit.dart'
    as _i46;
import 'features/auth/presentation/cubits/email_provider/email_provider_cubit.dart'
    as _i37;
import 'features/auth/presentation/cubits/facebook_provider/facebook_provider_cubit.dart'
    as _i38;
import 'features/auth/presentation/cubits/google_provider/google_provider_cubit.dart'
    as _i39;
import 'features/core/presentation/cubits/current_route/current_route_cubit.dart'
    as _i4;
import 'features/movie_details/data/repositories/movie_details_repository_impl.dart'
    as _i13;
import 'features/movie_details/data/services/movie_details_api_service_impl.dart'
    as _i11;
import 'features/movie_details/domain/repositories/movie_details_repository.dart'
    as _i12;
import 'features/movie_details/domain/services/movie_details_api_service.dart'
    as _i10;
import 'features/movie_details/presentation/cubits/cast/cast_cubit.dart'
    as _i48;
import 'features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart'
    as _i40;
import 'features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart'
    as _i14;
import 'features/movie_details/presentation/cubits/movie_images/movie_images_cubit.dart'
    as _i41;
import 'features/movie_details/presentation/cubits/recommendations/recommendations_cubit.dart'
    as _i43;
import 'features/movie_details/presentation/cubits/top5_movies/top20_movies_cubit.dart'
    as _i31;
import 'features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart'
    as _i33;
import 'features/movie_details/presentation/cubits/video/video_cubit.dart'
    as _i44;
import 'features/movie_details/presentation/cubits/watch_providers/watch_providers_cubit.dart'
    as _i45;
import 'features/movies_list/data/repositories/movies_repository_impl.dart'
    as _i18;
import 'features/movies_list/data/services/movies_api_service_impl.dart'
    as _i16;
import 'features/movies_list/domain/repositories/movies_repository.dart'
    as _i17;
import 'features/movies_list/domain/services/movies_api_service.dart' as _i15;
import 'features/movies_list/presentation/cubits/category_movies/category_movies_cubit.dart'
    as _i36;
import 'features/movies_list/presentation/cubits/random_genres/random_genres_cubit.dart'
    as _i27;
import 'features/movies_list/presentation/cubits/search_movies/search_movies_cubit.dart'
    as _i28;
import 'features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart'
    as _i29;
import 'features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart'
    as _i30;
import 'features/movies_list/presentation/cubits/top20_tv_shows_list/top20_tv_shows_list_cubit.dart'
    as _i32;
import 'features/people/data/repositories/person_details_repository_impl.dart'
    as _i22;
import 'features/people/data/services/person_details_api_service_impl.dart'
    as _i20;
import 'features/people/domain/repositories/person_details_repository.dart'
    as _i21;
import 'features/people/domain/services/person_details_api_service.dart'
    as _i19;
import 'features/people/presentation/cubits/person_credits/person_credits_cubit.dart'
    as _i49;
import 'features/people/presentation/cubits/person_details/person_details_cubit.dart'
    as _i42;
import 'features/profile/data/repositories/profile_repository_impl.dart'
    as _i26;
import 'features/profile/data/services/profile_api_service_impl.dart' as _i24;
import 'features/profile/domain/repositories/profile_repository.dart' as _i25;
import 'features/profile/domain/services/profile_api_service.dart' as _i23;
import 'features/profile/presentation/cubits/user_lists/user_lists_cubit.dart'
    as _i51;
import 'features/profile/presentation/cubits/user_profile/user_profile_cubit.dart'
    as _i50;
import 'features/settings/presentation/blocs/language_cubit.dart' as _i9;
import 'injectable_modules.dart' as _i52;

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
    gh.singleton<_i9.LanguageCubit>(_i9.LanguageCubit());
    gh.lazySingleton<_i10.MovieDetailsApiService>(
        () => _i11.MovieDetailsApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i12.MovieDetailsRepository>(() =>
        _i13.MovieDetailsRepositoryImpl(
            apiService: gh<_i10.MovieDetailsApiService>()));
    gh.singleton<_i14.MovieGenresCubit>(
        _i14.MovieGenresCubit(gh<_i12.MovieDetailsRepository>()));
    gh.lazySingleton<_i15.MoviesApiService>(
        () => _i16.MoviesApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i17.MoviesRepository>(() =>
        _i18.MoviesRepositoryImpl(apiService: gh<_i15.MoviesApiService>()));
    gh.lazySingleton<_i19.PersonDetailsApiService>(
        () => _i20.PersonDetailsApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i21.PersonDetailsRepository>(() =>
        _i22.PersonDetailsRepositoryImpl(
            apiService: gh<_i19.PersonDetailsApiService>()));
    gh.lazySingleton<_i23.ProfileApiService>(
        () => _i24.ProfileApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i25.ProfileRepository>(() => _i26.ProfileRepositoryImpl(
          gh<_i23.ProfileApiService>(),
          gh<_i7.FirebaseFirestore>(),
        ));
    gh.singleton<_i27.RandomGenresCubit>(_i27.RandomGenresCubit(
      gh<_i17.MoviesRepository>(),
      gh<_i14.MovieGenresCubit>(),
    ));
    gh.factory<_i28.SearchMoviesCubit>(
        () => _i28.SearchMoviesCubit(gh<_i17.MoviesRepository>()));
    gh.factory<_i29.SearchSuggestionsCubit>(
        () => _i29.SearchSuggestionsCubit(gh<_i17.MoviesRepository>()));
    gh.singleton<_i30.Top20MovieListCubit>(
        _i30.Top20MovieListCubit(gh<_i17.MoviesRepository>()));
    gh.singleton<_i31.Top20MoviesCubit>(_i31.Top20MoviesCubit(
      gh<_i30.Top20MovieListCubit>(),
      gh<_i12.MovieDetailsRepository>(),
    ));
    gh.singleton<_i32.Top20TvShowsListCubit>(
        _i32.Top20TvShowsListCubit(gh<_i17.MoviesRepository>()));
    gh.singleton<_i33.TvShowDetailsCubit>(
        _i33.TvShowDetailsCubit(gh<_i12.MovieDetailsRepository>()));
    gh.lazySingleton<_i34.AuthRepository>(
        () => _i35.AuthenticationRepositoryImpl(
              gh<_i6.FirebaseAuth>(),
              gh<_i8.GoogleSignIn>(),
              gh<_i5.FacebookAuth>(),
              gh<_i7.FirebaseFirestore>(),
            ));
    gh.singleton<_i36.CategoryMoviesCubit>(
        _i36.CategoryMoviesCubit(gh<_i17.MoviesRepository>()));
    gh.factory<_i37.EmailProviderCubit>(
        () => _i37.EmailProviderCubit(gh<_i34.AuthRepository>()));
    gh.factory<_i38.FacebookProviderCubit>(
        () => _i38.FacebookProviderCubit(gh<_i34.AuthRepository>()));
    gh.factory<_i39.GoogleProviderCubit>(
        () => _i39.GoogleProviderCubit(gh<_i34.AuthRepository>()));
    gh.singleton<_i40.MovieDetailsCubit>(
        _i40.MovieDetailsCubit(gh<_i12.MovieDetailsRepository>()));
    gh.singleton<_i41.MovieImagesCubit>(_i41.MovieImagesCubit(
      gh<_i12.MovieDetailsRepository>(),
      gh<_i40.MovieDetailsCubit>(),
      gh<_i33.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i42.PersonDetailsCubit>(
        _i42.PersonDetailsCubit(gh<_i21.PersonDetailsRepository>()));
    gh.singleton<_i43.RecommendationsCubit>(_i43.RecommendationsCubit(
      gh<_i12.MovieDetailsRepository>(),
      gh<_i40.MovieDetailsCubit>(),
      gh<_i33.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i44.VideoCubit>(_i44.VideoCubit(
      gh<_i12.MovieDetailsRepository>(),
      gh<_i40.MovieDetailsCubit>(),
      gh<_i33.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i45.WatchProvidersCubit>(_i45.WatchProvidersCubit(
      gh<_i12.MovieDetailsRepository>(),
      gh<_i40.MovieDetailsCubit>(),
      gh<_i33.TvShowDetailsCubit>(),
    ));
    gh.factory<_i46.AppleProviderCubit>(
        () => _i46.AppleProviderCubit(gh<_i34.AuthRepository>()));
    gh.singleton<_i47.AuthBloc>(_i47.AuthBloc(gh<_i34.AuthRepository>()));
    gh.singleton<_i48.CastCubit>(_i48.CastCubit(
      gh<_i12.MovieDetailsRepository>(),
      gh<_i40.MovieDetailsCubit>(),
      gh<_i33.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i49.PersonCreditsCubit>(_i49.PersonCreditsCubit(
      gh<_i21.PersonDetailsRepository>(),
      gh<_i42.PersonDetailsCubit>(),
    ));
    gh.singleton<_i50.UserProfileCubit>(_i50.UserProfileCubit(
      gh<_i25.ProfileRepository>(),
      gh<_i47.AuthBloc>(),
    ));
    gh.singleton<_i51.UserListsCubit>(_i51.UserListsCubit(
      gh<_i50.UserProfileCubit>(),
      gh<_i12.MovieDetailsRepository>(),
    ));
    return this;
  }
}

class _$HttpClient extends _i52.HttpClient {}

class _$FacebookSignInService extends _i52.FacebookSignInService {}

class _$FirebaseAuthenticationService
    extends _i52.FirebaseAuthenticationService {}

class _$FirebaseFirestoreService extends _i52.FirebaseFirestoreService {}

class _$GoogleSignInService extends _i52.GoogleSignInService {}
