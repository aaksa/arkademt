import 'package:arkademi/app/constant/constant.dart';
import 'package:arkademi/app/modules/course/controllers/course_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlsOverlay extends StatelessWidget {
  const ControlsOverlay({required this.controller});

  final CourseController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            reverseDuration: const Duration(milliseconds: 200),
            child: controller.isVideoPlayed.value
                ? const SizedBox.shrink()
                : Container(
                    color: Colors.black26,
                    child: Center(
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorCollections
                              .white, // Set the desired background color
                          boxShadow: [
                            BoxShadow(
                                color: ColorCollections
                                    .white05, // Set opacity to 0.5
                                spreadRadius:
                                    6.0, // Adjust the spread radius as needed
                                blurRadius:
                                    5.0, // Adjust the blur radius as needed
                                offset: Offset(0, 0),
                                blurStyle: BlurStyle.inner),
                          ],
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: ColorCollections.blue,
                          size: 40.0,
                          semanticLabel: 'Play',
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.isVideoPlayed.value
                ? controller.videCon.pause()
                : controller.videCon.play();
          },
        ),
      ],
    );
  }
}
