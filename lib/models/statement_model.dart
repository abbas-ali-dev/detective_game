import 'package:detective_game/models/enums/character.dart';
import 'package:json_annotation/json_annotation.dart';

part 'statement_model.g.dart';

@JsonSerializable()
class StatementModel {
  final Character suspect;
  final String statement;

  const StatementModel(this.suspect, this.statement);

  factory StatementModel.fromJson(Map<String, dynamic> json) =>
      _$StatementModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatementModelToJson(this);
}
