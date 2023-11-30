// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseImpl _$$CourseImplFromJson(Map<String, dynamic> json) => _$CourseImpl(
      courseName: json['course_name'] as String? ?? '-',
      progress: json['progress'] as String? ?? '-',
      curriculum: (json['curriculum'] as List<dynamic>?)
              ?.map((e) => CourseUnit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CourseUnit>[],
    );

Map<String, dynamic> _$$CourseImplToJson(_$CourseImpl instance) =>
    <String, dynamic>{
      'course_name': instance.courseName,
      'progress': instance.progress,
      'curriculum': instance.curriculum,
    };

_$CourseUnitImpl _$$CourseUnitImplFromJson(Map<String, dynamic> json) =>
    _$CourseUnitImpl(
      type: json['type'] as String? ?? '-',
      title: json['title'] as String? ?? '-',
      duration: json['duration'] as String? ?? '0',
      content: json['content'] as String? ?? '-',
      status: json['status'] as String? ?? '0',
      onlineVideoLink: json['online_video_link'] as String? ?? '-',
      offlineVideoLink: json['offline_video_link'] as String? ?? '-',
    );

Map<String, dynamic> _$$CourseUnitImplToJson(_$CourseUnitImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'duration': instance.duration,
      'content': instance.content,
      'status': instance.status,
      'online_video_link': instance.onlineVideoLink,
      'offline_video_link': instance.offlineVideoLink,
    };
