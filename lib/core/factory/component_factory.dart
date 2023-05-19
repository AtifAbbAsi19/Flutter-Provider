import 'package:flutter/cupertino.dart';

import '../../view_model/auth_view_model.dart';


class ViewModelComponentFactory<T> {
  T? getGenericType(ViewModelComponentFactoryName componentName) {
    switch (componentName) {
      case ViewModelComponentFactoryName.AUTH_VIEWMODEL:
        return AuthViewModel() as T;

      default:
        return null;
    }

    return null;
  }

  dynamic getGenericObject() {
    return null;
  }


}

enum ViewModelComponentFactoryName { AUTH_VIEWMODEL, HOME_VIEWMODEL }
