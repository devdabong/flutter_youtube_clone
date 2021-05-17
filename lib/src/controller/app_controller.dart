import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_project/src/components/youtube_bottom_sheet.dart';

enum RouteName { Home, Explore, Add, Subs, Library }

class AppController extends GetxService {
  // 앱이 꺼지기 전까지 계속 유지되야 하는 BottomNavigationBar ==> GetxService
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    if (RouteName.values[index] == RouteName.Add) {
      _showBottomSheet();
    } else {
      currentIndex(index);
    }
  }

  void _showBottomSheet() {
    Get.bottomSheet(YoutubeBottomSheet());
  }
}
