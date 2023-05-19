




import 'network_state.dart';

class ApiResponse<T> {

  NetworkStatus? status;
  T? data;
  String? message;

  //default constructor
  ApiResponse(this.status,this.data,this.message);

  //method to track loading
  ApiResponse.loading() :  status = NetworkStatus.LOADING;

  ApiResponse.completed() :  status = NetworkStatus.COMPLETED;

  ApiResponse.failure() :  status = NetworkStatus.FAILURE;

  ApiResponse.unauthorized() :  status = NetworkStatus.UNAUTHORIZED;


  String toString() {
    return "Status:$status \n Message:$message \n Response: $data";
  }


}