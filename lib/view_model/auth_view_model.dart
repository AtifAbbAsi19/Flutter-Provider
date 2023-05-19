import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../di/module/repository_module.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {


  final authRepo = Repository.authRepository();
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool isLoading) {
    _loading = isLoading;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoading(true);
    authRepo.loginApi(data).then((value) {
      setLoading(false);
      if (kDebugMode) {


        print("Flutter:HTTP : ${value.toString()}");
      }

      Utils.flushBarSuccessMessage("Login Successfull", context);

      Navigator.pushNamed(context, RoutesName.home);


    }).onError((error, stackTrace) {
      setLoading(false);

      if (kDebugMode) {
        print("Flutter:HTTP : ${error.toString()}");
      }
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }



  Future<void> signup(dynamic data, BuildContext context) async {
    setLoading(true);
    authRepo.registerApi(data).then((value) {
      setLoading(false);
      if (kDebugMode) {
        print("Flutter:HTTP : ${value.toString()}");
      }

      Utils.flushBarSuccessMessage("Login Successfull", context);

      Navigator.pushNamed(context, RoutesName.home);


    }).onError((error, stackTrace) {
      setLoading(false);

      if (kDebugMode) {
        print("Flutter:HTTP : ${error.toString()}");
      }
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

}
