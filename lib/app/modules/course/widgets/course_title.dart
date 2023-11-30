import 'package:arkademi/app/constant/constant.dart';
import 'package:arkademi/app/data/models/course_model.dart';
import 'package:flutter/material.dart';

class CourseTitle extends StatelessWidget {
  final CourseUnit courseunit;

  const CourseTitle({
    super.key,
    required this.courseunit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:
          BoxDecoration(color: Color.fromARGB(255, 236, 236, 236), boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 213, 213, 213), // Set opacity to 0.5
          spreadRadius: 1.0, // Adjust the spread radius as needed
          blurRadius: 1.0, // Adjust the blur radius as needed
          offset: Offset(0, 0),
        ),
      ]),
      padding: EdgeInsets.fromLTRB(16, 16, 28, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            courseunit.title,
            style: TextStyle(fontSize: 14, fontWeight: TextCollections.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "${courseunit.duration} Menit ",
            style: TextStyle(
                fontSize: 12,
                fontWeight: TextCollections.regular,
                color: const Color.fromARGB(255, 156, 156, 156)),
          )
        ],
      ),
    );
  }
}
