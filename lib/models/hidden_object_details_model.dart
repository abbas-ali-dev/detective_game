import 'package:json_annotation/json_annotation.dart';

part 'hidden_object_details_model.g.dart';

@JsonSerializable()
class HiddenObjectDetailsModel {
  final String name;
  final int x;
  final int y;
  final double height;
  final double width;
  final String path;
  bool isFound;

  HiddenObjectDetailsModel(
      this.name, this.x, this.y, this.width, this.height, this.path,
      {this.isFound = false});

  factory HiddenObjectDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$HiddenObjectDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$HiddenObjectDetailsModelToJson(this);

  void makeVisible() => isFound = true;
}
