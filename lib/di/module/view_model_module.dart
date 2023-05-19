import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../view_model/auth_view_model.dart';
import '../../view_model/user_view_model.dart';

class ViewModel {

  static AuthViewModel authViewModel(BuildContext context) {
    return Provider.of<AuthViewModel>(context);
  }

  static UserViewModel userViewModel(BuildContext context) {
    return Provider.of<UserViewModel>(context);
  }
}
