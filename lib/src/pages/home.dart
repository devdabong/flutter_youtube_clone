import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_project/src/components/custom_appbar.dart';
import 'package:youtube_clone_project/src/components/video_weidget.dart';
import 'package:youtube_clone_project/src/controller/home_controller.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              title: CustomAppBar(),
              //스크롤 내릴 때 AppBar 보이게 함. (floating, snap true)
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return GestureDetector(
                  onTap: () {
                    //page route
                    Get.toNamed("/detail/1234");
                  },
                  child: VideoWidget(
                      video: controller.youtubeResult.value.items[index]),
                );
              },
                  // ignore: unrelated_type_equality_checks
                  childCount: controller.youtubeResult.value.items == Null
                      ? 0
                      : controller.youtubeResult.value.items.length),
            ),
          ],
        ),
      ),
    );
  }
}
