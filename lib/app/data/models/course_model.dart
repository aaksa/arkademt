import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
class Course with _$Course {
  const factory Course({
    @JsonKey(name: 'course_name') @Default('-') String courseName,
    @JsonKey(name: 'progress') @Default('-') String progress,
    @JsonKey(name: 'curriculum')
    @Default(<CourseUnit>[])
    List<CourseUnit> curriculum,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

@freezed
class CourseUnit with _$CourseUnit {
  const factory CourseUnit({
    @JsonKey(name: 'type') @Default('-') String type,
    @JsonKey(name: 'title') @Default('-') String title,
    @JsonKey(name: 'duration') @Default('0') String duration,
    @JsonKey(name: 'content') @Default('-') String content,
    @JsonKey(name: 'status') @Default('0') String status,
    @JsonKey(name: 'online_video_link') @Default('-') String? onlineVideoLink,
    @JsonKey(name: 'offline_video_link') @Default('-') String? offlineVideoLink,
  }) = _CourseUnit;

  factory CourseUnit.fromJson(Map<String, dynamic> json) =>
      _$CourseUnitFromJson(_prepareJson(json));
}

// Helper method to convert integer values to strings
Map<String, dynamic> _prepareJson(Map<String, dynamic> json) {
  // Convert integer values to strings if needed
  // Example: json['someInteger'] = json['someInteger'].toString();
  if (json.containsKey('duration')) {
    json['duration'] = json['duration'].toString();
  }

    if (json.containsKey('status')) {
    json['status'] = json['status'].toString();
  }
  // Return the modified json
  return json;
}
