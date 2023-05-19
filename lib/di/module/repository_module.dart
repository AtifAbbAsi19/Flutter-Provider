import '../../repository/auth_repository.dart';
import 'network_module.dart';

class Repository {

  static AuthRepository authRepository() {
    return AuthRepositoryImp(serviceApi: NetworkModule.networkService());
  }

}
