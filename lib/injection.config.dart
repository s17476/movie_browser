// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i7;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'features/auth/data/repositories/authentication_repository_impl.dart'
    as _i32;
import 'features/auth/domain/repositories/auth_repository.dart' as _i31;
import 'features/auth/presentation/blocs/auth/auth_bloc.dart' as _i43;
import 'features/auth/presentation/cubits/apple_provider/apple_provider_cubit.dart'
    as _i42;
import 'features/auth/presentation/cubits/email_provider/email_provider_cubit.dart'
    as _i34;
import 'features/auth/presentation/cubits/facebook_provider/facebook_provider_cubit.dart'
    as _i35;
import 'features/auth/presentation/cubits/google_provider/google_provider_cubit.dart'
    as _i36;
import 'features/movie_details/data/repositories/movie_details_repository_impl.dart'
    as _i11;
import 'features/movie_details/data/services/movie_details_api_service_impl.dart'
    as _i9;
import 'features/movie_details/domain/repositories/movie_details_repository.dart'
    as _i10;
import 'features/movie_details/domain/services/movie_details_api_service.dart'
    as _i8;
import 'features/movie_details/presentation/cubits/cast/cast_cubit.dart'
    as _i44;
import 'features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart'
    as _i37;
import 'features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart'
    as _i12;
import 'features/movie_details/presentation/cubits/movie_images/movie_images_cubit.dart'
    as _i38;
import 'features/movie_details/presentation/cubits/recommendations/recommendations_cubit.dart'
    as _i40;
import 'features/movie_details/presentation/cubits/top5_movies/top20_movies_cubit.dart'
    as _i28;
import 'features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart'
    as _i30;
import 'features/movie_details/presentation/cubits/video/video_cubit.dart'
    as _i41;
import 'features/movies_list/data/repositories/movies_repository_impl.dart'
    as _i16;
import 'features/movies_list/data/services/movies_api_service_impl.dart'
    as _i14;
import 'features/movies_list/domain/repositories/movies_repository.dart'
    as _i15;
import 'features/movies_list/domain/services/movies_api_service.dart' as _i13;
import 'features/movies_list/presentation/cubits/category_movies/category_movies_cubit.dart'
    as _i33;
import 'features/movies_list/presentation/cubits/random_genres/random_genres_cubit.dart'
    as _i24;
import 'features/movies_list/presentation/cubits/search_movies/search_movies_cubit.dart'
    as _i25;
import 'features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart'
    as _i26;
import 'features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart'
    as _i27;
import 'features/movies_list/presentation/cubits/top20_tv_shows_list/top20_tv_shows_list_cubit.dart'
    as _i29;
import 'features/people/data/repositories/person_details_repository_impl.dart'
    as _i20;
import 'features/people/data/services/person_details_api_service_impl.dart'
    as _i18;
import 'features/people/domain/repositories/person_details_repository.dart'
    as _i19;
import 'features/people/domain/services/person_details_api_service.dart'
    as _i17;
import 'features/people/presentation/cubits/person_credits/person_credits_cubit.dart'
    as _i45;
import 'features/people/presentation/cubits/person_details/person_details_cubit.dart'
    as _i39;
import 'features/profile/data/repositories/profile_repository_impl.dart'
    as _i22;
import 'features/profile/domain/repositories/profile_repository.dart' as _i21;
import 'features/profile/domain/services/profile_api_service.dart' as _i23;
import 'injectable_modules.dart' as _i46;

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
    gh.lazySingleton<_i4.FacebookAuth>(
        () => facebookSignInService.facebookSignIn);
    gh.lazySingleton<_i5.FirebaseAuth>(
        () => firebaseAuthenticationService.firebaseAuth);
    gh.lazySingleton<_i6.FirebaseFirestore>(
        () => firebaseFirestoreService.firebaseFirestore);
    gh.lazySingleton<_i7.GoogleSignIn>(() => googleSignInService.googleSignIn);
    gh.lazySingleton<_i8.MovieDetailsApiService>(
        () => _i9.MovieDetailsApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i10.MovieDetailsRepository>(() =>
        _i11.MovieDetailsRepositoryImpl(
            apiService: gh<_i8.MovieDetailsApiService>()));
    gh.singleton<_i12.MovieGenresCubit>(
        _i12.MovieGenresCubit(gh<_i10.MovieDetailsRepository>()));
    gh.lazySingleton<_i13.MoviesApiService>(
        () => _i14.MoviesApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i15.MoviesRepository>(() =>
        _i16.MoviesRepositoryImpl(apiService: gh<_i13.MoviesApiService>()));
    gh.lazySingleton<_i17.PersonDetailsApiService>(
        () => _i18.PersonDetailsApiServiceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i19.PersonDetailsRepository>(() =>
        _i20.PersonDetailsRepositoryImpl(
            apiService: gh<_i17.PersonDetailsApiService>()));
    gh.lazySingleton<_i21.ProfileRepository>(() => _i22.ProfileRepositoryImpl(
          gh<_i23.ProfileApiService>(),
          gh<_i6.FirebaseFirestore>(),
        ));
    gh.singleton<_i24.RandomGenresCubit>(_i24.RandomGenresCubit(
      gh<_i15.MoviesRepository>(),
      gh<_i12.MovieGenresCubit>(),
    ));
    gh.factory<_i25.SearchMoviesCubit>(
        () => _i25.SearchMoviesCubit(gh<_i15.MoviesRepository>()));
    gh.factory<_i26.SearchSuggestionsCubit>(
        () => _i26.SearchSuggestionsCubit(gh<_i15.MoviesRepository>()));
    gh.singleton<_i27.Top20MovieListCubit>(
        _i27.Top20MovieListCubit(gh<_i15.MoviesRepository>()));
    gh.singleton<_i28.Top20MoviesCubit>(_i28.Top20MoviesCubit(
      gh<_i27.Top20MovieListCubit>(),
      gh<_i10.MovieDetailsRepository>(),
    ));
    gh.singleton<_i29.Top20TvShowsListCubit>(
        _i29.Top20TvShowsListCubit(gh<_i15.MoviesRepository>()));
    gh.singleton<_i30.TvShowDetailsCubit>(
        _i30.TvShowDetailsCubit(gh<_i10.MovieDetailsRepository>()));
    gh.lazySingleton<_i31.AuthRepository>(
        () => _i32.AuthenticationRepositoryImpl(
              gh<_i5.FirebaseAuth>(),
              gh<_i7.GoogleSignIn>(),
              gh<_i4.FacebookAuth>(),
            ));
    gh.singleton<_i33.CategoryMoviesCubit>(
        _i33.CategoryMoviesCubit(gh<_i15.MoviesRepository>()));
    gh.factory<_i34.EmailProviderCubit>(
        () => _i34.EmailProviderCubit(gh<_i31.AuthRepository>()));
    gh.factory<_i35.FacebookProviderCubit>(
        () => _i35.FacebookProviderCubit(gh<_i31.AuthRepository>()));
    gh.factory<_i36.GoogleProviderCubit>(
        () => _i36.GoogleProviderCubit(gh<_i31.AuthRepository>()));
    gh.singleton<_i37.MovieDetailsCubit>(
        _i37.MovieDetailsCubit(gh<_i10.MovieDetailsRepository>()));
    gh.singleton<_i38.MovieImagesCubit>(_i38.MovieImagesCubit(
      gh<_i10.MovieDetailsRepository>(),
      gh<_i37.MovieDetailsCubit>(),
      gh<_i30.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i39.PersonDetailsCubit>(
        _i39.PersonDetailsCubit(gh<_i19.PersonDetailsRepository>()));
    gh.singleton<_i40.RecommendationsCubit>(_i40.RecommendationsCubit(
      gh<_i10.MovieDetailsRepository>(),
      gh<_i37.MovieDetailsCubit>(),
      gh<_i30.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i41.VideoCubit>(_i41.VideoCubit(
      gh<_i10.MovieDetailsRepository>(),
      gh<_i37.MovieDetailsCubit>(),
      gh<_i30.TvShowDetailsCubit>(),
    ));
    gh.factory<_i42.AppleProviderCubit>(
        () => _i42.AppleProviderCubit(gh<_i31.AuthRepository>()));
    gh.singleton<_i43.AuthBloc>(_i43.AuthBloc(gh<_i31.AuthRepository>()));
    gh.singleton<_i44.CastCubit>(_i44.CastCubit(
      gh<_i10.MovieDetailsRepository>(),
      gh<_i37.MovieDetailsCubit>(),
      gh<_i30.TvShowDetailsCubit>(),
    ));
    gh.singleton<_i45.PersonCreditsCubit>(_i45.PersonCreditsCubit(
      gh<_i19.PersonDetailsRepository>(),
      gh<_i39.PersonDetailsCubit>(),
    ));
    return this;
  }
}

class _$HttpClient extends _i46.HttpClient {}

class _$FirebaseAuthenticationService
    extends _i46.FirebaseAuthenticationService {}

class _$FirebaseFirestoreService extends _i46.FirebaseFirestoreService {}

class _$GoogleSignInService extends _i46.GoogleSignInService {}

class _$FacebookSignInService extends _i46.FacebookSignInService {}
