import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../app_exceptions.dart';
import 'api_durations.dart';
import 'base_api_service.dart';

class NetworkService extends BaseApiService {
  @override
  Future getGetResponse(String url) async {
    dynamic responseJson;

    ApiDuration apiDuration = AuthApiTimeOutDuration();

    try {
      final response = await http.get(Uri.parse(url), headers: {
        HttpHeaders.contentTypeHeader: "application/json"
      }).timeout(apiDuration.getDuration());

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions("No Internet Connected!");
    }
    return responseJson;
  }

  @override
  Future getPostResponse(String url, data) async {
    dynamic responseJson;

    try {
      final response = await http.post(Uri.parse(url), body: data, headers: {
        HttpHeaders.contentTypeHeader: "application/json"
      }).timeout(const Duration(seconds: 30));
      //.timeout(TimeDuration(30).getDuration());
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions("No Internet Connected!");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestExceptions(response.body.toString());
      case 500:
      case 404:
        throw UnAuthorizedExceptions(response.body.toString());
      default:
        throw FetchDataExceptions(
            "Error occurred While Communicating with Server!" +
                "with status code " +
                response.statusCode.toString());
    }
  }

  @override
  ApiDurations getDuration() {
    return TimeDuration();
  }
}

abstract class ApiDuration {
  Duration getDuration();
}

class AuthApiTimeOutDuration implements ApiDuration {
  @override
  Duration getDuration() {
    return const Duration(seconds: 30);
  }
}
