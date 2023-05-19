part of 'auth_view_model_bloc.dart';
//import 'package:equatable/equatable.dart';

enum LoginStatus {
  success,
  failure,
  loading,
}

@immutable
class LoginState extends Equatable { //to check the same state , to prevent from rebuilding 

  const LoginState({
    this.message = '',
    this.status = LoginStatus.loading,
    this.email = '',
    this.password = '',
  });

  final String message;
  final LoginStatus status;
  final String email;
  final String password;


  /**
   *     ***copy of object***
   * copyWith method, which basically means that we will be mutating the same state variable for all the status.
   * The main change here is that, if we are not providing any value to the copyWith method,
   * it will be using the value which we provided during creating the object of the state
   */
  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? message,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        email,
        password,
      ];
}

/*abstract class AuthenticationState extends Equatable {
  //to check the same state , to prevent from rebuilding

}


class AuthenticationUninitialized extends AuthenticationState {

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthenticationLoading extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}*/
