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
import 'features/movie_details/presentation/cubits/top5_movies/top5_movies_cubit.dart'
    as _i12;
import 'features/movies_list/data/repositories/movies_repository_impl.dart'
    as _i10;
import 'features/movies_list/data/services/movies_api_service_impl.dart' as _i8;
import 'features/movies_list/domain/repositories/movies_repository.dart' as _i9;
import 'features/movies_list/domain/services/movies_api_service.dart' as _i7;
import 'features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart'
    as _i11;

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
    gh.lazySingleton<_i7.MoviesApiService>(() => _i8.MoviesApiServiceImpl());
    gh.lazySingleton<_i9.MoviesRepository>(() =>
        _i10.MoviesRepositoryImpl(apiService: gh<_i7.MoviesApiService>()));
    gh.singleton<_i11.Top20MovieListCubit>(
        _i11.Top20MovieListCubit(gh<_i9.MoviesRepository>()));
    gh.singleton<_i12.Top5MoviesCubit>(_i12.Top5MoviesCubit(
      gh<_i11.Top20MovieListCubit>(),
      gh<_i5.MovieDetailsRepository>(),
    ));
    return this;
  }
}
