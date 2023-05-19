class SharedPreference {
  SharedPreference._privateConstructor();

  static final SharedPreference _instance =
      SharedPreference._privateConstructor();

  static SharedPreference get instance => _instance;
}

/*


https://stackoverflow.com/questions/12649573/how-do-you-build-a-singleton-in-dart

class SharedPreference {

  SharedPreference._privateConstructor();

  static final SharedPreference instance = SharedPreference._privateConstructor();

}*/

/*
class SharedPreference {

  SharedPreference._privateConstructor();

  static final SingletonOne _instance = SharedPreference._privateConstructor();

  factory SharedPreference() {
    return _instance;
  }

}*/

/*

//Lazy loading

class SharedPreferences {
  static SharedPreferences? _instance;

  SharedPreferences._();

  static SharedPreferences get instance => _instance ??= SharedPreferences._();

  void doSomething() {

  }

}
 */
