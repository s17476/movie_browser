// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i7;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import 'features/auth/data/repositories/authentication_repository_impl.dart'
    as _i20;
import 'features/auth/domain/repositories/auth_repository.dart' as _i19;
import 'features/auth/presentation/blocs/auth/auth_bloc.dart' as _i27;
import 'features/auth/presentation/cubits/apple_provider/apple_provider_cubit.dart'
    as _i26;
import 'features/auth/presentation/cubits/email_provider/email_provider_cubit.dart'
    as _i24;
import 'features/auth/presentation/cubits/facebook_provider/facebook_provider_cubit.dart'
    as _i25;
import 'features/auth/presentation/cubits/google_provider/google_provider_cubit.dart'
    as _i23;
import 'features/core/presentation/cubits/current_route/current_route_cubit.dart'
    as _i3;
import 'features/movie_details/data/repositories/movie_details_repository_impl.dart'
    as _i22;
import 'features/movie_details/data/services/movie_details_api_service_impl.dart'
    as _i12;
import 'features/movie_details/domain/repositories/movie_details_repository.dart'
    as _i21;
import 'features/movie_details/domain/services/movie_details_api_service.dart'
    as _i11;
import 'features/movie_details/presentation/cubits/cast/cast_cubit.dart'
    as _i46;
import 'features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart'
    as _i36;
import 'features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart'
    as _i37;
import 'features/movie_details/presentation/cubits/movie_images/movie_images_cubit.dart'
    as _i44;
import 'features/movie_details/presentation/cubits/recommendations/recommendations_cubit.dart'
    as _i48;
import 'features/movie_details/presentation/cubits/top20_movies/top20_movies_cubit.dart'
    as _i40;
import 'features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart'
    as _i38;
import 'features/movie_details/presentation/cubits/video/video_cubit.dart'
    as _i45;
import 'features/movie_details/presentation/cubits/watch_providers/watch_providers_cubit.dart'
    as _i47;
import 'features/movies_list/data/repositories/movies_repository_impl.dart'
    as _i29;
import 'features/movies_list/data/services/movies_api_service_impl.dart'
    as _i18;
import 'features/movies_list/domain/repositories/movies_repository.dart'
    as _i28;
import 'features/movies_list/domain/services/movies_api_service.dart' as _i17;
import 'features/movies_list/presentation/cubits/category_movies/category_movies_cubit.dart'
    as _i49;
import 'features/movies_list/presentation/cubits/random_genres/random_genres_cubit.dart'
    as _i50;
import 'features/movies_list/presentation/cubits/search_movies/search_movies_cubit.dart'
    as _i32;
import 'features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart'
    as _i33;
import 'features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart'
    as _i34;
import 'features/movies_list/presentation/cubits/top20_tv_shows_list/top20_tv_shows_list_cubit.dart'
    as _i35;
import 'features/people/data/repositories/person_details_repository_impl.dart'
    as _i31;
import 'features/people/data/services/person_details_api_service_impl.dart'
    as _i14;
import 'features/people/domain/repositories/person_details_repository.dart'
    as _i30;
import 'features/people/domain/services/person_details_api_service.dart'
    as _i13;
import 'features/people/presentation/cubits/person_credits/person_credits_cubit.dart'
    as _i43;
import 'features/people/presentation/cubits/person_details/person_details_cubit.dart'
    as _i42;
import 'features/profile/data/repositories/profile_repository_impl.dart'
    as _i16;
import 'features/profile/data/services/profile_api_service_impl.dart' as _i10;
import 'features/profile/domain/repositories/profile_repository.dart' as _i15;
import 'features/profile/domain/services/profile_api_service.dart' as _i9;
import 'features/profile/presentation/cubits/user_lists/user_lists_cubit.dart'
    as _i41;
import 'features/profile/presentation/cubits/user_profile/user_profile_cubit.dart'
    as _i39;
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
    final firebaseAuthenticationService = _$FirebaseAuthenticationService();
    final firebaseFirestoreService = _$FirebaseFirestoreService();
    final googleSignInService = _$GoogleSignInService();
    final facebookSignInService = _$FacebookSignInService();
    gh.singleton<_i3.CurrentRouteCubit>(() => _i3.CurrentRouteCubit());
    gh.lazySingleton<_i4.Client>(() => httpClient.httpClient);
    gh.lazySingleton<_i5.FirebaseAuth>(
        () => firebaseAuthenticationService.firebaseAuth);
    gh.lazySingleton<_i6.FirebaseFirestore>(
        () => firebaseFirestoreService.firebaseFirestore);
    gh.lazySingleton<_i7.GoogleSignIn>(() => googleSignInService.googleSignIn);
    gh.lazySingleton<_i8.FacebookAuth>(
        () => facebookSignInService.facebookSignIn);
    gh.lazySingleton<_i9.ProfileApiService>(
        () => _i10.ProfileApiServiceImpl(client: gh<_i4.Client>()));
    gh.lazySingleton<_i11.MovieDetailsApiService>(
        () => _i12.MovieDetailsApiServiceImpl(client: gh<_i4.Client>()));
    gh.lazySingleton<_i13.PersonDetailsApiService>(
        () => _i14.PersonDetailsApiServiceImpl(client: gh<_i4.Client>()));
    gh.lazySingleton<_i15.ProfileRepository>(() => _i16.ProfileRepositoryImpl(
          gh<_i9.ProfileApiService>(),
          gh<_i6.FirebaseFirestore>(),
        ));
    gh.lazySingleton<_i17.MoviesApiService>(
        () => _i18.MoviesApiServiceImpl(client: gh<_i4.Client>()));
    gh.lazySingleton<_i19.AuthRepository>(
        () => _i20.AuthenticationRepositoryImpl(
              gh<_i5.FirebaseAuth>(),
              gh<_i7.GoogleSignIn>(),
              gh<_i8.FacebookAuth>(),
              gh<_i6.FirebaseFirestore>(),
            ));
    gh.lazySingleton<_i21.MovieDetailsRepository>(() =>
        _i22.MovieDetailsRepositoryImpl(
            apiService: gh<_i11.MovieDetailsApiService>()));
    gh.factory<_i23.GoogleProviderCubit>(
        () => _i23.GoogleProviderCubit(gh<_i19.AuthRepository>()));
    gh.factory<_i24.EmailProviderCubit>(
        () => _i24.EmailProviderCubit(gh<_i19.AuthRepository>()));
    gh.factory<_i25.FacebookProviderCubit>(
        () => _i25.FacebookProviderCubit(gh<_i19.AuthRepository>()));
    gh.factory<_i26.AppleProviderCubit>(
        () => _i26.AppleProviderCubit(gh<_i19.AuthRepository>()));
    gh.singleton<_i27.AuthBloc>(
      () => _i27.AuthBloc(gh<_i19.AuthRepository>()),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i28.MoviesRepository>(() =>
        _i29.MoviesRepositoryImpl(apiService: gh<_i17.MoviesApiService>()));
    gh.lazySingleton<_i30.PersonDetailsRepository>(() =>
        _i31.PersonDetailsRepositoryImpl(
            apiService: gh<_i13.PersonDetailsApiService>()));
    gh.factory<_i32.SearchMoviesCubit>(
        () => _i32.SearchMoviesCubit(gh<_i28.MoviesRepository>()));
    gh.factory<_i33.SearchSuggestionsCubit>(
        () => _i33.SearchSuggestionsCubit(gh<_i28.MoviesRepository>()));
    gh.singleton<_i34.Top20MovieListCubit>(
        () => _i34.Top20MovieListCubit(gh<_i28.MoviesRepository>()));
    gh.singleton<_i35.Top20TvShowsListCubit>(
        () => _i35.Top20TvShowsListCubit(gh<_i28.MoviesRepository>()));
    gh.singleton<_i36.MovieDetailsCubit>(
        () => _i36.MovieDetailsCubit(gh<_i21.MovieDetailsRepository>()));
    gh.singleton<_i37.MovieGenresCubit>(
        () => _i37.MovieGenresCubit(gh<_i21.MovieDetailsRepository>()));
    gh.singleton<_i38.TvShowDetailsCubit>(
        () => _i38.TvShowDetailsCubit(gh<_i21.MovieDetailsRepository>()));
    gh.singleton<_i39.UserProfileCubit>(() => _i39.UserProfileCubit(
          gh<_i15.ProfileRepository>(),
          gh<_i27.AuthBloc>(),
        ));
    gh.singleton<_i40.Top20MoviesCubit>(() => _i40.Top20MoviesCubit(
          gh<_i34.Top20MovieListCubit>(),
          gh<_i21.MovieDetailsRepository>(),
        ));
    gh.singleton<_i41.UserListsCubit>(() => _i41.UserListsCubit(
          gh<_i39.UserProfileCubit>(),
          gh<_i21.MovieDetailsRepository>(),
        ));
    gh.singleton<_i42.PersonDetailsCubit>(
        () => _i42.PersonDetailsCubit(gh<_i30.PersonDetailsRepository>()));
    gh.singleton<_i43.PersonCreditsCubit>(() => _i43.PersonCreditsCubit(
          gh<_i30.PersonDetailsRepository>(),
          gh<_i42.PersonDetailsCubit>(),
        ));
    gh.singleton<_i44.MovieImagesCubit>(() => _i44.MovieImagesCubit(
          gh<_i21.MovieDetailsRepository>(),
          gh<_i36.MovieDetailsCubit>(),
          gh<_i38.TvShowDetailsCubit>(),
        ));
    gh.singleton<_i45.VideoCubit>(() => _i45.VideoCubit(
          gh<_i21.MovieDetailsRepository>(),
          gh<_i36.MovieDetailsCubit>(),
          gh<_i38.TvShowDetailsCubit>(),
        ));
    gh.singleton<_i46.CastCubit>(
      () => _i46.CastCubit(
        gh<_i21.MovieDetailsRepository>(),
        gh<_i36.MovieDetailsCubit>(),
        gh<_i38.TvShowDetailsCubit>(),
      ),
      dispose: (i) => i.close(),
    );
    gh.singleton<_i47.WatchProvidersCubit>(() => _i47.WatchProvidersCubit(
          gh<_i21.MovieDetailsRepository>(),
          gh<_i36.MovieDetailsCubit>(),
          gh<_i38.TvShowDetailsCubit>(),
        ));
    gh.singleton<_i48.RecommendationsCubit>(() => _i48.RecommendationsCubit(
          gh<_i21.MovieDetailsRepository>(),
          gh<_i36.MovieDetailsCubit>(),
          gh<_i38.TvShowDetailsCubit>(),
        ));
    gh.singleton<_i49.CategoryMoviesCubit>(
        () => _i49.CategoryMoviesCubit(gh<_i28.MoviesRepository>()));
    gh.singleton<_i50.RandomGenresCubit>(() => _i50.RandomGenresCubit(
          gh<_i28.MoviesRepository>(),
          gh<_i37.MovieGenresCubit>(),
        ));
    return this;
  }
}

class _$HttpClient extends _i51.HttpClient {}

class _$FirebaseAuthenticationService
    extends _i51.FirebaseAuthenticationService {}

class _$FirebaseFirestoreService extends _i51.FirebaseFirestoreService {}

class _$GoogleSignInService extends _i51.GoogleSignInService {}

class _$FacebookSignInService extends _i51.FacebookSignInService {}
