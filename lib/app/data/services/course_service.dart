import 'package:arkademi/app/data/models/course_model.dart';
import 'package:dio/dio.dart';

// final dio = Dio();

// void getHttp() async {
//   final response = await dio.get('https://dart.dev');
//   print(response);
// }

class CourseService {
  final Dio dio = Dio();

  static const String apiUrl =
      'https://engineer-test-eight.vercel.app/course-status.json';

  Future<Course> getCourse() async {
    try {
      final response = await dio.get(apiUrl);

      print(response);
      print("INI STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = response.data;
        return Course.fromJson(data);
        
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      rethrow;
    }
  }
}
