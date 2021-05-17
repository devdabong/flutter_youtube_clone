import 'package:get/get.dart';
import 'package:youtube_clone_project/src/models/youtube_video_result.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  Future<YoutubeVideoResult> loadVideos() async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyAKINwC1CBlgeOuxR1tpt3T0AlxGnJm5uw";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      // if (null != response.body["items"] && response.body["items"].length > 0) {
      //   return YoutubeVideoResult.fromJson(response.body);
      // }
      print(response.body["items"]);
      return YoutubeVideoResult.fromJson(response.body);
    }
  }
}
