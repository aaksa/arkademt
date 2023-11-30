import 'dart:io';

import 'package:arkademi/app/data/models/course_model.dart';
import 'package:arkademi/app/data/services/course_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class CourseController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin<Course> {
  //TODO: Implement CourseController

  final CourseService _courseService = CourseService();
  var isLoading = false.obs;

  final _course = Course().obs;

  // final currentSelected = CourseUnit().obs;
  final currentSelectedIndex = 1.obs;

  Course get course => _course.value;

  final _coursesUnit = <CourseUnit>[].obs;
  final _courseUnitOnly = <CourseUnit>[].obs;

  List<CourseUnit> get coursesUnit => _coursesUnit;

  late VideoPlayerController videCon;
  RxBool isVideoInitialized = false.obs;
  RxBool isVideoPlayed = false.obs;

  final count = 0.obs;
  late TabController tabController;
  RxInt currentTabIndex = 0.obs;

  List<String> listTabMenu = ["Kurikulum", "Ikhtisar", "Lampiran"];

  //changed the link of the videos cause i can't access it
  Future<void> findCourse() async {
    if (!isLoading.value) {
      isLoading.value = true;
      try {
        if (_course.value.isBlank!) {
          change(_course.value, status: RxStatus.loading());
        }

        final data = await _courseService.getCourse();
        _course.value = data;

        List<CourseUnit> result = [];
        int j = 0;
        for (int i = 0; i < data.curriculum.length; i++) {
          var unit = data.curriculum[i];
          if (unit.type == "unit") {
            // Ensure that i is within the bounds of listVideo
            if (j <= listVideo.length) {
              result.add(
                CourseUnit(
                  type: unit.type,
                  title: unit.title,
                  duration: unit.duration,
                  content: unit.content,
                  status: unit.status,
                  onlineVideoLink:
                      listVideo[j], // Use value from listVideo at index i
                  offlineVideoLink:
                      listVideo[j], // Use value from listVideo at index i
                ),
              );
            } else {
              result.add(
                CourseUnit(
                  type: unit.type,
                  title: unit.title,
                  duration: unit.duration,
                  content: unit.content,
                  status: unit.status,
                ),
              );
              // Handle the case where listVideo does not have enough elements
              // You might want to throw an exception or handle it according to your logic
            }
            j++;
          } else {
            result.add(unit);
          }
        }

        _coursesUnit.addAll(result);

        print(_coursesUnit);
        change(_course.value, status: RxStatus.success());
      } catch (e) {
        print("ERROR " + e.toString());
        change(_course.value, status: RxStatus.error());
      } finally {
        isLoading.value = false;
      }
    }
  }

  void changeVideo(int index) {
    // currentSelected.value = coursesUnit[index];
    currentSelectedIndex.value = index;

    videCon = VideoPlayerController.networkUrl(
        Uri.parse(coursesUnit[currentSelectedIndex.value].onlineVideoLink!));
    videCon.setLooping(true);
    videCon.addListener(() {
      isVideoInitialized.value = videCon.value.isInitialized;
      isVideoPlayed.value = videCon.value.isPlaying;
      update();
    });
    videCon.initialize().then((_) {
      isVideoInitialized.value = true;

      // Ensure the first frame is shown after the video is initialized
      update();
    });
  }

  @override
  void onInit() {
    findCourse();

    tabController = TabController(length: 3, vsync: this);
    videCon = VideoPlayerController.networkUrl(Uri.parse(listVideo[0]));

    videCon.setLooping(true);
    videCon.addListener(() {
      isVideoInitialized.value = videCon.value.isInitialized;
      isVideoPlayed.value = videCon.value.isPlaying;
      update();
    });
    videCon.initialize().then((_) {
      isVideoInitialized.value = true;

      // Ensure the first frame is shown after the video is initialized
      update();
    });
    // videCon.play();
    isStoragePermission();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    videCon
        .dispose(); // Dispose of the video controller when the controller is closed
    super.onClose();
    super.onClose();
  }

  void increment() => count.value++;

  //NOTES
  //im using dummy video cause i can't access it
  List<String> listVideo = [
    "https://media.istockphoto.com/id/1437925837/id/video/insinyur-perangkat-lunak-junior-wanita-menulis-kode-di-komputer-desktop-dengan-dua-monitor.mp4?s=mp4-640x640-is&k=20&c=VpivDW1ITDuZzsr7bLbIdwIorAOYV7OPs7f-8Hd9WdI=",
    "https://media.istockphoto.com/id/1298701454/id/video/kucing-panik-membeli-atau-menjual-saham-bitcoin-tampilan-depan.mp4?s=mp4-640x640-is&k=20&c=ZMXZtMTbzFF2mRgdna2ubbPOFMuWBehEyKEGsJs-tSM=",
    "https://media.istockphoto.com/id/1171483712/id/video/komik-pussycat-bergerak-di-lingkungan-biru-dalam-irama-stylish.mp4?s=mp4-640x640-is&k=20&c=UgvMsfZwp4Ni2Yo15id9F0opddx2Q50xBpn-goVZvG8=",
    "https://media.istockphoto.com/id/1127894647/id/video/pria-kutu-buku-ceria-dengan-kacamata-menari-dan-berpesta.mp4?s=mp4-640x640-is&k=20&c=VfG89ZOQloDMeVhIe7zmhs9hubhhQbkd2qquSq_lltc=",
    "https://media.istockphoto.com/id/1400778321/id/video/alien-melakukan-tarian-ayam-terisolasi-di-atas-kunci-kroma-biru.mp4?s=mp4-640x640-is&k=20&c=MW8Pjm0DFy8szPAGuDYzAy6fek81-j2GTJ2_RRE3F2I=",
    "https://media.istockphoto.com/id/1201584550/id/video/gerakan-lambat-karyawan-lucu-menari-di-ruang-kantor-mengenakan-headphone.mp4?s=mp4-640x640-is&k=20&c=WG3EwVLFqHdcdXM67PqR5XKm2xKczJyQNuYOtq4t1sg=",
  ];



  Future<File?> downloadVideo(String videoUrl, String name) async {
    Dio dio = Dio();
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      String fileName = name;
      String filePath = '${directory.path}/$fileName.mp4';

      final file = File(filePath);

      // Check if the file already exists
      if (await file.exists()) {
        print('File already exists: $filePath');
        return file;
      }

      final response = await dio.get(videoUrl,
          options: Options(
              responseType: ResponseType.bytes, followRedirects: false));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close;

      print('Downloaded video: $filePath');

      return file;
    } catch (e) {
      print('Error downloading video: $e');
    }
    return null;
  }

  Future<bool> isAlreadyDownloaded(String name) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String fileName = name;
    String filePath = '${directory.path}/$fileName.mp4';

    final file = File(filePath);

    return file.exists();
  }

  Future<void> deleteVideo(String name) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String fileName = name;
    String filePath = '${directory.path}/$fileName.mp4';

    final file = File(filePath);

    file.delete();
  }

  Future openFile({required String url, String? filename}) async {
    // final name = filename ?? url.split('/'). last;
    final file = await downloadVideo(url, filename!);
    if (file == null) return;

    print('Path : ${file.path}');
    print("ANJING");

    // OpenFile.open(file.path);
    if (await File(file.path).exists()) {
      OpenFile.open(file.path);
    } else {
      print('File does not exist at path: ${file.path}');
    }
  }

  isStoragePermission() async {
    var isStorage = await Permission.storage.status;
    if (!isStorage.isGranted) {
      await Permission.storage.request();
      if (!isStorage.isGranted) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}
