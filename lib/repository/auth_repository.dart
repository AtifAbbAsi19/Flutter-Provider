import '../data/model/UserModel.dart';
import '../data/network/core/base_api_service.dart';
import '../di/module/network_module.dart';
import '../res/endpoints.dart';

abstract class AuthRepository {

  Future<dynamic> loginApi(dynamic data);

  Future<dynamic> registerApi(dynamic data);


}

class AuthRepositoryImp extends AuthRepository {
  // var serviceApi = NetworkModule.networkService();

  AuthRepositoryImp({required this.serviceApi});

  final BaseApiService serviceApi;

  @override
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await serviceApi.getPostResponse(EndPoint.loginApiEndPoint, data);
      return UserModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await serviceApi.getPostResponse(EndPoint.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
