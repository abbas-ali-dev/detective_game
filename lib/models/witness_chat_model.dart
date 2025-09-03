import 'package:detective_game/models/enums/character.dart';
import 'package:detective_game/models/statement_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'witness_chat_model.g.dart';

@JsonSerializable()
class WitnessChatModel {
  final Character witness;
  final String description;
  final List<StatementModel> chats;

  const WitnessChatModel(this.witness, this.description, this.chats);

  factory WitnessChatModel.fromJson(Map<String, dynamic> json) =>
      _$WitnessChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$WitnessChatModelToJson(this);
}
