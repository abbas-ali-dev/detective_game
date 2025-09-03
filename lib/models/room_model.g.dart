// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      $enumDecode(_$CharacterEnumMap, json['person']),
      (json['hiddenObjects'] as List<dynamic>)
          .map((e) =>
              HiddenObjectDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'person': _$CharacterEnumMap[instance.person],
      'hiddenObjects': instance.hiddenObjects,
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
