// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  @JsonKey(name: 'course_name')
  String get courseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress')
  String get progress => throw _privateConstructorUsedError;
  @JsonKey(name: 'curriculum')
  List<CourseUnit> get curriculum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call(
      {@JsonKey(name: 'course_name') String courseName,
      @JsonKey(name: 'progress') String progress,
      @JsonKey(name: 'curriculum') List<CourseUnit> curriculum});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseName = null,
    Object? progress = null,
    Object? curriculum = null,
  }) {
    return _then(_value.copyWith(
      courseName: null == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String,
      curriculum: null == curriculum
          ? _value.curriculum
          : curriculum // ignore: cast_nullable_to_non_nullable
              as List<CourseUnit>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseImplCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$CourseImplCopyWith(
          _$CourseImpl value, $Res Function(_$CourseImpl) then) =
      __$$CourseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'course_name') String courseName,
      @JsonKey(name: 'progress') String progress,
      @JsonKey(name: 'curriculum') List<CourseUnit> curriculum});
}

/// @nodoc
class __$$CourseImplCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$CourseImpl>
    implements _$$CourseImplCopyWith<$Res> {
  __$$CourseImplCopyWithImpl(
      _$CourseImpl _value, $Res Function(_$CourseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseName = null,
    Object? progress = null,
    Object? curriculum = null,
  }) {
    return _then(_$CourseImpl(
      courseName: null == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String,
      curriculum: null == curriculum
          ? _value._curriculum
          : curriculum // ignore: cast_nullable_to_non_nullable
              as List<CourseUnit>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseImpl implements _Course {
  const _$CourseImpl(
      {@JsonKey(name: 'course_name') this.courseName = '-',
      @JsonKey(name: 'progress') this.progress = '-',
      @JsonKey(name: 'curriculum')
      final List<CourseUnit> curriculum = const <CourseUnit>[]})
      : _curriculum = curriculum;

  factory _$CourseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseImplFromJson(json);

  @override
  @JsonKey(name: 'course_name')
  final String courseName;
  @override
  @JsonKey(name: 'progress')
  final String progress;
  final List<CourseUnit> _curriculum;
  @override
  @JsonKey(name: 'curriculum')
  List<CourseUnit> get curriculum {
    if (_curriculum is EqualUnmodifiableListView) return _curriculum;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_curriculum);
  }

  @override
  String toString() {
    return 'Course(courseName: $courseName, progress: $progress, curriculum: $curriculum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseImpl &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            const DeepCollectionEquality()
                .equals(other._curriculum, _curriculum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, courseName, progress,
      const DeepCollectionEquality().hash(_curriculum));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      __$$CourseImplCopyWithImpl<_$CourseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseImplToJson(
      this,
    );
  }
}

abstract class _Course implements Course {
  const factory _Course(
          {@JsonKey(name: 'course_name') final String courseName,
          @JsonKey(name: 'progress') final String progress,
          @JsonKey(name: 'curriculum') final List<CourseUnit> curriculum}) =
      _$CourseImpl;

  factory _Course.fromJson(Map<String, dynamic> json) = _$CourseImpl.fromJson;

  @override
  @JsonKey(name: 'course_name')
  String get courseName;
  @override
  @JsonKey(name: 'progress')
  String get progress;
  @override
  @JsonKey(name: 'curriculum')
  List<CourseUnit> get curriculum;
  @override
  @JsonKey(ignore: true)
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseUnit _$CourseUnitFromJson(Map<String, dynamic> json) {
  return _CourseUnit.fromJson(json);
}

/// @nodoc
mixin _$CourseUnit {
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  String get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'online_video_link')
  String? get onlineVideoLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'offline_video_link')
  String? get offlineVideoLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseUnitCopyWith<CourseUnit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseUnitCopyWith<$Res> {
  factory $CourseUnitCopyWith(
          CourseUnit value, $Res Function(CourseUnit) then) =
      _$CourseUnitCopyWithImpl<$Res, CourseUnit>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String type,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'duration') String duration,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'online_video_link') String? onlineVideoLink,
      @JsonKey(name: 'offline_video_link') String? offlineVideoLink});
}

/// @nodoc
class _$CourseUnitCopyWithImpl<$Res, $Val extends CourseUnit>
    implements $CourseUnitCopyWith<$Res> {
  _$CourseUnitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? duration = null,
    Object? content = null,
    Object? status = null,
    Object? onlineVideoLink = freezed,
    Object? offlineVideoLink = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      onlineVideoLink: freezed == onlineVideoLink
          ? _value.onlineVideoLink
          : onlineVideoLink // ignore: cast_nullable_to_non_nullable
              as String?,
      offlineVideoLink: freezed == offlineVideoLink
          ? _value.offlineVideoLink
          : offlineVideoLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseUnitImplCopyWith<$Res>
    implements $CourseUnitCopyWith<$Res> {
  factory _$$CourseUnitImplCopyWith(
          _$CourseUnitImpl value, $Res Function(_$CourseUnitImpl) then) =
      __$$CourseUnitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String type,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'duration') String duration,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'online_video_link') String? onlineVideoLink,
      @JsonKey(name: 'offline_video_link') String? offlineVideoLink});
}

/// @nodoc
class __$$CourseUnitImplCopyWithImpl<$Res>
    extends _$CourseUnitCopyWithImpl<$Res, _$CourseUnitImpl>
    implements _$$CourseUnitImplCopyWith<$Res> {
  __$$CourseUnitImplCopyWithImpl(
      _$CourseUnitImpl _value, $Res Function(_$CourseUnitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? duration = null,
    Object? content = null,
    Object? status = null,
    Object? onlineVideoLink = freezed,
    Object? offlineVideoLink = freezed,
  }) {
    return _then(_$CourseUnitImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      onlineVideoLink: freezed == onlineVideoLink
          ? _value.onlineVideoLink
          : onlineVideoLink // ignore: cast_nullable_to_non_nullable
              as String?,
      offlineVideoLink: freezed == offlineVideoLink
          ? _value.offlineVideoLink
          : offlineVideoLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseUnitImpl implements _CourseUnit {
  const _$CourseUnitImpl(
      {@JsonKey(name: 'type') this.type = '-',
      @JsonKey(name: 'title') this.title = '-',
      @JsonKey(name: 'duration') this.duration = '0',
      @JsonKey(name: 'content') this.content = '-',
      @JsonKey(name: 'status') this.status = '0',
      @JsonKey(name: 'online_video_link') this.onlineVideoLink = '-',
      @JsonKey(name: 'offline_video_link') this.offlineVideoLink = '-'});

  factory _$CourseUnitImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseUnitImplFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'duration')
  final String duration;
  @override
  @JsonKey(name: 'content')
  final String content;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'online_video_link')
  final String? onlineVideoLink;
  @override
  @JsonKey(name: 'offline_video_link')
  final String? offlineVideoLink;

  @override
  String toString() {
    return 'CourseUnit(type: $type, title: $title, duration: $duration, content: $content, status: $status, onlineVideoLink: $onlineVideoLink, offlineVideoLink: $offlineVideoLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseUnitImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.onlineVideoLink, onlineVideoLink) ||
                other.onlineVideoLink == onlineVideoLink) &&
            (identical(other.offlineVideoLink, offlineVideoLink) ||
                other.offlineVideoLink == offlineVideoLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, title, duration, content,
      status, onlineVideoLink, offlineVideoLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseUnitImplCopyWith<_$CourseUnitImpl> get copyWith =>
      __$$CourseUnitImplCopyWithImpl<_$CourseUnitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseUnitImplToJson(
      this,
    );
  }
}

abstract class _CourseUnit implements CourseUnit {
  const factory _CourseUnit(
      {@JsonKey(name: 'type') final String type,
      @JsonKey(name: 'title') final String title,
      @JsonKey(name: 'duration') final String duration,
      @JsonKey(name: 'content') final String content,
      @JsonKey(name: 'status') final String status,
      @JsonKey(name: 'online_video_link') final String? onlineVideoLink,
      @JsonKey(name: 'offline_video_link')
      final String? offlineVideoLink}) = _$CourseUnitImpl;

  factory _CourseUnit.fromJson(Map<String, dynamic> json) =
      _$CourseUnitImpl.fromJson;

  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'duration')
  String get duration;
  @override
  @JsonKey(name: 'content')
  String get content;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'online_video_link')
  String? get onlineVideoLink;
  @override
  @JsonKey(name: 'offline_video_link')
  String? get offlineVideoLink;
  @override
  @JsonKey(ignore: true)
  _$$CourseUnitImplCopyWith<_$CourseUnitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
