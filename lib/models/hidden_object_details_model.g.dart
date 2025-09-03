// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hidden_object_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiddenObjectDetailsModel _$HiddenObjectDetailsModelFromJson(
        Map<String, dynamic> json) =>
    HiddenObjectDetailsModel(
      json['name'] as String,
      json['x'] as int,
      json['y'] as int,
      (json['width'] as num).toDouble(),
      (json['height'] as num).toDouble(),
      json['path'] as String,
      isFound: json['isFound'] as bool? ?? false,
    );

Map<String, dynamic> _$HiddenObjectDetailsModelToJson(
        HiddenObjectDetailsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'x': instance.x,
      'y': instance.y,
      'height': instance.height,
      'width': instance.width,
      'path': instance.path,
      'isFound': instance.isFound,
    };
