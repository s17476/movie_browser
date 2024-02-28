part of 'current_route_cubit.dart';

@freezed
class CurrentRouteState with _$CurrentRouteState {
  const CurrentRouteState._();

  const factory CurrentRouteState({
    @Default('/') String route,
    String? previous,
  }) = _CurrentRouteState;

  bool isCurrent(String? route) => route != null && this.route == route;

  bool isPrevious(String? route) => route != null && previous == route;
}
