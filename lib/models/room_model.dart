import 'package:detective_game/models/enums/character.dart';
import 'package:detective_game/models/hidden_object_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_model.g.dart';

@JsonSerializable()
class RoomModel {
  final Character person;
  final List<HiddenObjectDetailsModel> hiddenObjects;

  const RoomModel(this.person, this.hiddenObjects);

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
