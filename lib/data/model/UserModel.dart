

//https://javiercbk.github.io/json_to_dart/
//import 'package:shared_preferences/shared_preferences.dart';
class UserModel {
  String? _token;
  String? _userName;

  UserModel({String? token,String? userName}) {
    if (token != null) {
      this._token = token;
    }
    if(null!=userName){
      this._userName = userName;
    }

  }

  String? get userName => _userName;

  String? get token => _token;

  set token(String? token) => _token = token;

  UserModel.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
    _userName = json['c'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this._token;
    data['_userName'] = this._userName;
    return data;
  }
}