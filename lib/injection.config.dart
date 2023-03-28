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

import 'features/movies_list/data/repositories/movies_repository_impl.dart'
    as _i6;
import 'features/movies_list/data/services/movies_api_service_impl.dart' as _i4;
import 'features/movies_list/domain/repositories/movies_repository.dart' as _i5;
import 'features/movies_list/domain/services/movies_api_service.dart' as _i3;
import 'features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart'
    as _i7;

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
    gh.lazySingleton<_i3.MoviesApiService>(() => _i4.MoviesApiServiceImpl());
    gh.lazySingleton<_i5.MoviesRepository>(
        () => _i6.MoviesRepositoryImpl(apiService: gh<_i3.MoviesApiService>()));
    gh.singleton<_i7.Top20MovieListCubit>(
        _i7.Top20MovieListCubit(gh<_i5.MoviesRepository>()));
    return this;
  }
}
