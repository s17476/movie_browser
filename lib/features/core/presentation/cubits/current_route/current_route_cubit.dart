import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'current_route_state.dart';
part 'current_route_cubit.freezed.dart';

@singleton
class CurrentRouteCubit extends Cubit<CurrentRouteState> {
  CurrentRouteCubit() : super(const CurrentRouteState());

  void update(String route) {
    emit(CurrentRouteState(
      route: route,
      previous: state.route,
    ));
  }
}
