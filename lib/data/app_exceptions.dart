

class AppExceptions implements Exception{

  final _message;
  final prefix; //routes , end point

  //constructor
  AppExceptions([
        this._message,
        this.prefix
  ]);

  //to string method
  String toString(){
    return "$prefix : $_message";
  }
}



class FetchDataExceptions extends AppExceptions{
  FetchDataExceptions([String? message]) :super(message,"Error During Communication!");
}


class BadRequestExceptions extends AppExceptions{
  BadRequestExceptions([String? message]) :super(message,"Invalid Request!");
}

class UnAuthorizedExceptions extends AppExceptions{
  UnAuthorizedExceptions([String? message]) :super(message,"UnAuthorized Request!");
}