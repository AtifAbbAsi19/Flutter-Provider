

import 'api_durations.dart';

abstract class BaseApiService{


  Future<dynamic> getGetResponse(String url);


  Future<dynamic> getPostResponse(String url , dynamic data);


  ApiDurations getDuration();


}