import 'package:get/get.dart';

import '../modules/course/bindings/course_binding.dart';
import '../modules/course/views/course_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.COURSE;

  static final routes = [
    GetPage(
      name: _Paths.COURSE,
      page: () => const CourseView(),
      binding: CourseBinding(),
    ),
  ];
}
