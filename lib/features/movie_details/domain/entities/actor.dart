// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';
part 'actor.g.dart';

@freezed
class Actor with _$Actor {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Actor({
    required int id,
    required String name,
    required String? profilePath,
    required String character,
    required String charactecvcr,
    required String charactcvcvcer,
    required String charactcvcer,
    required String charactcvcevvr,
    required String characvcvter,
    required String charavccter,
    required String charactdfer,
    required String chara23cter,
    required String char4acter,
    required String charracter,
    required String characters,
    required String characteer,
    required String charactter,
    required String characmter,
    required String charancter,
    required String charbacter,
    required String charactenr,
    required String characteyr,
    required String charactuer,
    required String charapicter,
    required String charkacter,
    required String chajracter,
    required String character2,
    required String characte3r,
    required String charact4er,
    required String charac5ter,
    required String charanctdddder,
    required String characterh,
    required String characteddd3r,
    required String charactedr,
    required String charactesr,
    required String charactera,
    required String charactser,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}
