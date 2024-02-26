// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch_provider.freezed.dart';
part 'watch_provider.g.dart';

enum ProviderType { flatrate, rent, buy }

@freezed
class WatchProvider with _$WatchProvider {
  const WatchProvider._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WatchProvider({
    required int providerId,
    required int displayPriority,
    required String providerName,
    required String? logoPath,
    @Default(ProviderType.flatrate) ProviderType providerType,
  }) = _WatchProvider;

  factory WatchProvider.fromJson(Map<String, dynamic> json) =>
      _$WatchProviderFromJson(json);

  factory WatchProvider.fromJsonWithType(
      Map<String, dynamic> json, ProviderType providerType) {
    final provider = WatchProvider.fromJson(json);

    return provider.copyWith(providerType: providerType);
  }
}
