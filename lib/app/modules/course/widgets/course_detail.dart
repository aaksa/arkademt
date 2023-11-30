import 'package:arkademi/app/constant/constant.dart';
import 'package:arkademi/app/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

class CourseDetail extends StatelessWidget {
  final CourseUnit courseunit;
  final bool isSelected;
  final void Function() onPress;
  final void Function() onPressButton;

  const CourseDetail({
    super.key,
    required this.courseunit,
    required this.isSelected,
    required this.onPress,
    required this.onPressButton,
  });

  @override
  Widget build(BuildContext context) {
    var unescape = HtmlUnescape();
    var textname = unescape.convert(courseunit.title);

    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: !isSelected
              ? Color.fromARGB(255, 255, 255, 255)
              : Color.fromARGB(255, 218, 236, 245),
          border: Border(
            top: BorderSide(
                color: const Color.fromARGB(150, 158, 158, 158),
                width: 0.2), // Top border
            bottom: BorderSide(
                color: const Color.fromARGB(150, 158, 158, 158),
                width: 0.2), // Bottom border
          ),
        ),
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.play_circle,
                  color: ColorCollections.black05,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textname,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, fontWeight: TextCollections.regular),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${courseunit.duration} Menit",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: TextCollections.regular,
                            color: const Color.fromARGB(255, 156, 156, 156)),
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      height: 28,
                      child: TextButton(
                          onPressed: onPressButton,
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                const Color.fromARGB(255, 0, 118, 202)),
                            side: MaterialStatePropertyAll(
                                BorderSide(color: Colors.black12, width: 1.0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tonton Offline",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: TextCollections.bold,
                                    color: ColorCollections.white),
                              ),
                              // SizedBox(
                              //   width: 4,
                              // ),
                              // Icon(
                              //   Icons.check_circle_outline_outlined,
                              //   size: 14,
                              //   color: ColorCollections.blue,
                              // )
                            ],
                          )),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
