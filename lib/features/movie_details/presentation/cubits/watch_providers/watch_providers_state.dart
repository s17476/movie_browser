part of 'watch_providers_cubit.dart';

@freezed
class WatchProvidersState with _$WatchProvidersState {
  const WatchProvidersState._();
  const factory WatchProvidersState.initial() = _Initial;
  const factory WatchProvidersState.lodaing() = _Loading;
  const factory WatchProvidersState.error() = _Error;
  const factory WatchProvidersState.loaded({
    required int id,
    required List<WatchProvider> providers,
  }) = _Loaded;

  List<WatchProvider> _providersByType(ProviderType providerType) => maybeMap(
        loaded: (state) => state.providers
            .where((element) => element.providerType == providerType)
            .toList(),
        orElse: () => [],
      );

  List<WatchProvider> get streamProviders =>
      _providersByType(ProviderType.flatrate);

  List<WatchProvider> get rentProviders => _providersByType(ProviderType.rent);

  List<WatchProvider> get buyProviders => _providersByType(ProviderType.buy);

  @override
  String toString() => maybeMap(
        loaded: (state) =>
            'Id: ${state.id}\nStream providers: ${state.streamProviders.length}\nRent providers: ${state.rentProviders.length}\nBuy providers: ${state.buyProviders.length}\n',
        orElse: () => super.toString(),
      );
}
