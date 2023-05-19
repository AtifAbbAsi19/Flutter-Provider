



import '../../data/network/core/base_api_service.dart';
import '../../data/network/core/network_api_service.dart';

class NetworkModule{

  static BaseApiService networkService() {
   // BaseApiService apiService = NetworkService();
    return  NetworkService();
  }





}