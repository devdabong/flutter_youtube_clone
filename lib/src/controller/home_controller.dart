import 'package:get/get.dart';
import 'package:youtube_clone_project/src/models/youtube_video_result.dart';
import 'package:youtube_clone_project/src/repository/youtube_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(
      totalResults: 0, resultsPerPage: 0, nextPageToken: '', items: []).obs;

  @override
  void onInit() {
    _videoLoad();
    super.onInit();
  }

  void _videoLoad() async {
    YoutubeVideoResult youtubeVideoResult =
        await YoutubeRepository.to.loadVideos();

    if (youtubeVideoResult.items.length > 0) {
      print(youtubeVideoResult.items.length);
      youtubeResult(youtubeVideoResult);
    }
  }
}
