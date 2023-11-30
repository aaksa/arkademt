import 'dart:ffi';

import 'package:arkademi/app/constant/constant.dart';
import 'package:arkademi/app/data/models/course_model.dart';
import 'package:arkademi/app/modules/course/widgets/controls_overlay.dart';
import 'package:arkademi/app/modules/course/widgets/course_detail.dart';
import 'package:arkademi/app/modules/course/widgets/course_title.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/course_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:video_player/video_player.dart';
import 'package:html_unescape/html_unescape.dart';

class CourseView extends GetView<CourseController> {
  const CourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.currentSelected.value =
    //     controller.coursesUnit[];
    var unescape = HtmlUnescape();

    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.centerLeft,
            child: Obx(() => Text(controller.course.courseName))),
        titleTextStyle: TextCollections.headerText
            .copyWith(fontWeight: TextCollections.bold),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back,
          color: ColorCollections.black,
        ),
        backgroundColor: ColorCollections.white,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
            child: Obx(() => getGradientProgressStyle()),
          )
        ],
      ),
      body: controller.obx(
        (state) {
          if (state.isBlank!) {
            return const Center(
              child: Text(
                "ERROR",
                style: TextStyle(
                  color: ColorCollections.black,
                  fontSize: 16,
                ),
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => Center(
                      child: controller.isVideoInitialized.value
                          ? AspectRatio(
                              aspectRatio: controller.videCon.value.aspectRatio,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  VideoPlayer(controller.videCon),
                                  ControlsOverlay(controller: controller),
                                  VideoProgressIndicator(controller.videCon,
                                      allowScrubbing: true),
                                ],
                              ))
                          : const SizedBox(
                              height: 50,
                              width: double.infinity,
                              child:
                                  Center(child: CircularProgressIndicator()))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 8, 8, 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(() {
                      var textname = unescape.convert(controller
                          .coursesUnit[controller.currentSelectedIndex.value]
                          .title);
                      return Text(textname);
                    }),
                  ),
                ),
                DefaultTabController(
                  length: 3,
                  initialIndex: 1,
                  child: Obx(
                    () => controller.currentTabIndex.value > -1
                        ? TabBar(
                            onTap: (value) {
                              controller.currentTabIndex(value);
                            },
                            controller: controller.tabController,
                            indicatorWeight: 3,
                            labelStyle: const TextStyle(
                                color: ColorCollections.black,
                                fontWeight: TextCollections.semiBold),
                            labelColor: ColorCollections.black,
                            unselectedLabelColor: ColorCollections.black05,
                            tabs: controller.listTabMenu
                                .map((item) => Tab(
                                      text: item,
                                    ))
                                .toList(),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
                Obx(() {
                  // controller.currentSelected(controller
                  //     .coursesUnit[controller.currentSelectedIndex.value]);
                  if (controller.currentTabIndex.value == 0) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(
                          0, 0, 0, kBottomNavigationBarHeight),
                      child: Column(
                        children: [
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.coursesUnit.length +
                                  (controller.isLoading.value ? 1 : 0),
                              // itemCount: 10,
                              itemBuilder: (context, index) {
                                if (controller.coursesUnit[index].type ==
                                    "unit") {
                                  return CourseDetail(
                                    courseunit: controller.coursesUnit[index],
                                    isSelected:
                                        controller.currentSelectedIndex.value ==
                                            index,
                                    onPress: () {
                                      controller.currentSelectedIndex.value =
                                          index;
                                      // controller.currentSelected(
                                      //     controller.coursesUnit[index]);
                                      controller.changeVideo(index);
                                      controller.update();
                                    },
                                    onPressButton: () {
                                      showDownloadedFilesModal(
                                          controller.coursesUnit[index]);
                                    },
                                  );
                                } else {
                                  return CourseTitle(
                                      courseunit:
                                          controller.coursesUnit[index]);
                                }
                              })
                          // CourseTitle(),
                        ],
                      ),
                    ); //1st custom tabBarView
                  } else if (controller.currentTabIndex.value == 1) {
                    return Container(); //2nd custom tabBarView
                  } else {
                    return Container(); //3rd tabView
                  }
                }),
              ],
            ),
          );
        },
        onEmpty: const Center(
          child: Text(
            "KOSONG",
            style: TextStyle(
              color: ColorCollections.black,
              fontSize: 16,
            ),
          ),
        ),
        onError: (error) => Center(
          child: Text(error!),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      bottomSheet: Obx(
        () => Row(
          children: [
            controller.currentSelectedIndex > 1
                ? Expanded(
                    child: TextButton(
                      onPressed: () {
                        while (controller.currentSelectedIndex.value > 1) {
                          controller.currentSelectedIndex.value =
                              controller.currentSelectedIndex.value - 1;
                          if (controller
                                  .coursesUnit[
                                      controller.currentSelectedIndex.value]
                                  .type ==
                              "unit") {
                            break;
                          }
                        }
                        controller
                            .changeVideo(controller.currentSelectedIndex.value);
                        controller.update();
                        // controller.changeVideo(index);
                      },
                      child: const Text(
                        "<< Sebelumnya",
                        style: TextStyle(
                            color: ColorCollections.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "<< Sebelumnya",
                        style: TextStyle(
                            color: ColorCollections.black05,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
            controller.currentSelectedIndex < controller.coursesUnit.length - 1
                ? Expanded(
                    child: TextButton(
                      onPressed: () {
                        while (controller.currentSelectedIndex.value <
                            controller.coursesUnit.length) {
                          controller.currentSelectedIndex.value =
                              controller.currentSelectedIndex.value + 1;
                          if (controller
                                  .coursesUnit[
                                      controller.currentSelectedIndex.value]
                                  .type ==
                              "unit") {
                            break;
                          }
                        }
                        controller
                            .changeVideo(controller.currentSelectedIndex.value);
                        controller.update();
                      },
                      child: const Text(
                        "Selanjutnya >>",
                        style: TextStyle(
                            color: ColorCollections.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Selanjutnya >>",
                        style: TextStyle(
                            color: ColorCollections.black05,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Future<void> showDownloadedFilesModal(CourseUnit course) async {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(color: ColorCollections.white05),
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.openFile(
                      url: course.onlineVideoLink!, filename: course.title);
                  Get.back(); // Close the modal
                  // OpenFile()
                  //   controller.openFile(
                  //     url:"https://sample-videos.com/video123/mp4/360/big_buck_bunny_360p_1mb.mp4", filename: "Video.mp4");
                },
                child: await controller.isAlreadyDownloaded(course.title)
                    ? const Text("Open")
                    : const Text("Download")),
            await controller.isAlreadyDownloaded(course.title)
                ? ElevatedButton(
                    onPressed: () {
                      controller.deleteVideo(course.title);
                      Get.back(); // Close the modal
                    },
                    child: const Text("Delete Video"))
                : ElevatedButton(
                    onPressed: () {
                      Get.back(); // Close the modal
                    },
                    child: const Text("Back"))
          ],
        ),
      ),
    );
  }

  Widget getGradientProgressStyle() {
    return SizedBox(
        height: 100,
        width: 100,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.8,
              axisLineStyle: const AxisLineStyle(
                thickness: 0.2,
                color: Color.fromARGB(30, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: const <GaugePointer>[
                RangePointer(
                    value: 40,
                    width: 0.2,
                    sizeUnit: GaugeSizeUnit.factor,
                    enableAnimation: true,
                    animationDuration: 75,
                    animationType: AnimationType.linear,
                    gradient: SweepGradient(
                        colors: <Color>[Color(0xFFa4edeb), Color(0xFF00a9b5)],
                        stops: <double>[0.25, 0.75])),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    positionFactor: 0.1,
                    widget: Text(
                      '${controller.course.progress}%',
                      style: const TextStyle(
                          color: ColorCollections.black,
                          fontWeight: TextCollections.semiBold,
                          fontSize: 11),
                    ))
              ]),
        ]));
  }
}
