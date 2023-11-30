import 'package:arkademi/app/data/models/course_model.dart';
import 'package:arkademi/app/data/services/course_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CourseService service;

 
  service = CourseService();


  test("GetApi", () async {
    // Act
    final actualCourse = await service.getCourse();

    // Assert
    expect(actualCourse, isA<Course>());
    expect(actualCourse.courseName, isNotNull);
    expect(actualCourse.progress, isNotNull);
    expect(actualCourse.curriculum, isA<List<CourseUnit>>());

    for (final unit in actualCourse.curriculum) {
      expect(unit.type, isNotNull);
      expect(unit.title, isNotNull);
      expect(unit.duration, isNotNull);
      expect(unit.content, isNotNull);
      expect(unit.status, isNotNull);
      expect(unit.onlineVideoLink, isNotNull);
      expect(unit.offlineVideoLink, isNotNull);
    }
  });



}
