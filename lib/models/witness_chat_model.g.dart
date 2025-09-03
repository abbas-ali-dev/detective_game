// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'witness_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WitnessChatModel _$WitnessChatModelFromJson(Map<String, dynamic> json) =>
    WitnessChatModel(
      $enumDecode(_$CharacterEnumMap, json['witness']),
      json['description'] as String,
      (json['chats'] as List<dynamic>)
          .map((e) => StatementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WitnessChatModelToJson(WitnessChatModel instance) =>
    <String, dynamic>{
      'witness': _$CharacterEnumMap[instance.witness],
      'description': instance.description,
      'chats': instance.chats,
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
