import '../di/module/repository_module.dart';
import '../repository/auth_repository.dart';

abstract class AuthService {

  Future<dynamic> login(dynamic data);

  Future<dynamic> register(dynamic data);
}

class AuthServiceImp extends AuthService {
  //final authRepo = Repository.authRepository();

  final AuthRepository authRepo;

  AuthServiceImp({required this.authRepo});

  @override
  Future login(data) {
    return authRepo.loginApi(data);
  }

  @override
  Future register(data) {
    return authRepo.loginApi(data);
  }
}
