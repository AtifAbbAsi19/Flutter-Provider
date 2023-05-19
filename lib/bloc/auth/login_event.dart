part of 'auth_view_model_bloc.dart';


abstract class LoginEvents {
}


class LoadingEvent extends LoginEvents{

  LoadingEvent();

}

class LoginButtonPressedEvent extends LoginEvents{

   LoginButtonPressedEvent();

}

class LoginEmailChangedEvent  extends LoginEvents{

  LoginEmailChangedEvent ({required this.email});

  final String email;

  @override
  List<Object> get props => [email];

}


class LoginPasswordChangedEvent  extends LoginEvents{

  LoginPasswordChangedEvent ({required this.password});

  final String password;

  @override
  List<Object> get props => [password];

}


