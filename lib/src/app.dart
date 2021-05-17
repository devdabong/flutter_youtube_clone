import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_project/src/controller/app_controller.dart';
import 'package:youtube_clone_project/src/pages/explore.dart';
import 'package:youtube_clone_project/src/pages/home.dart';
import 'package:youtube_clone_project/src/pages/library.dart';
import 'package:youtube_clone_project/src/pages/subscribe.dart';

class App extends GetView<AppController> {
  //const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.Home:
            return Home();
          case RouteName.Explore:
            return Explore();
          case RouteName.Add:
            return Container();
          case RouteName.Subs:
            return Subscribe();
          case RouteName.Library:
            return Library();
        }

        // if (controller.currentIndex.value == 0) {
        //   return Home();
        // } else if (controller.currentIndex.value == 1) {
        //   return Explore();
        // } else if (controller.currentIndex.value == 3) {
        //   return Subscribe();
        // } else if (controller.currentIndex.value == 4) {
        //   return Library();
        // } else {
        //   return Home();
        // }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          // onTap: (index) {
          //   print(index);
          //   AppController.to.changePageIndex(index);
          // },
          onTap: controller.changePageIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/home_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/home_on.svg"),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/icons/compass_off.svg",
                width: 22,
              ),
              activeIcon: SvgPicture.asset(
                "assets/svg/icons/compass_on.svg",
                width: 22,
              ),
              label: "탐색",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SvgPicture.asset(
                  "assets/svg/icons/plus.svg",
                  width: 35,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/subs_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/subs_on.svg"),
              label: "구독",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/library_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/library_on.svg"),
              label: "보관함",
            ),
          ],
        ),
      ),
    );
  }
}
