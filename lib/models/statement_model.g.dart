// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatementModel _$StatementModelFromJson(Map<String, dynamic> json) =>
    StatementModel(
      $enumDecode(_$CharacterEnumMap, json['suspect']),
      json['statement'] as String,
    );

Map<String, dynamic> _$StatementModelToJson(StatementModel instance) =>
    <String, dynamic>{
      'suspect': _$CharacterEnumMap[instance.suspect],
      'statement': instance.statement,
    };

const _$CharacterEnumMap = {
  Character.colonel: 'colonel',
  Character.artist: 'artist',
  Character.cook: 'cook',
  Character.nurse: 'nurse',
  Character.policeman: 'policeman',
  Character.doctor: 'doctor',
  Character.nun: 'nun',
};
