import '../../view_model/auth_view_model.dart';

class ProviderModule{

  static AuthViewModel authViewModel() {
    return AuthViewModel();
  }

}