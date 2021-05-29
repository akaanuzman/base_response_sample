import '../../core/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  String? episode;
  String? url;
  String? created;

  CharacterModel(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.image,
      this.episode,
      this.url,
      this.created});

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> get toJson => _$CharacterModelToJson(this);
}

@JsonSerializable()
class BaseResponseCharacter extends BaseResponseModel {
  List<CharacterModel>? results;

  BaseResponseCharacter({this.results});

  factory BaseResponseCharacter.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseCharacterFromJson(json);

  Map<String, dynamic> get toJson => _$BaseResponseCharacterToJson(this);
}
