import 'package:json_annotation/json_annotation.dart';

part 'timeline_object.g.dart';

@JsonSerializable()
class TimelineObject {
  TimelineObject(this.startTime, this.subTitle, this.numHours, this.title);
  String startTime;
  String title;
  String? subTitle;
  int numHours;

  factory TimelineObject.fromJson(Map<String, dynamic> json) =>
      _$TimelineObjectFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$TimelineObjectToJson(this);
}
