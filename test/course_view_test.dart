import 'package:arkademi/app/modules/course/controllers/course_controller.dart';
import 'package:arkademi/app/modules/course/views/course_view.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('CourseView displays course information', (WidgetTester tester) async {
    // Arrange
    final controller = CourseController();
    await controller.findCourse(); // Load course data

    await tester.pumpWidget(
      GetMaterialApp(
        home: CourseView(),
        initialBinding: BindingsBuilder(() {
          Get.lazyPut<CourseController>(() => controller);
        }),
      ),
    );

    // Act
    await tester.pump();

    // Assert
    expect(find.text(controller.course.courseName), findsOneWidget);
    expect(find.text(controller.course.progress + '%'), findsOneWidget);

    // Add more assertions based on your widget structure and the expected UI state
  });
}
