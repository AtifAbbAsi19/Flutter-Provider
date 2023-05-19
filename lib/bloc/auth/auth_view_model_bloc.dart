import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../service/auth_service.dart';

part 'login_event.dart';

part 'login_state.dart';


class AuthViewModelBloc extends Bloc<LoginEvents, LoginState> {
  final AuthService service;

  //AuthViewModelBloc(super.initialState);

  //list

  AuthViewModelBloc({required this.service}) : super(const LoginState()){
    on((event, emit) => (){



    });
  }




  Future<void> _handleSignupEmailChangedEvent(
      LoginButtonPressedEvent event,
      Emitter<LoginState> emit,
      ) async {
    emit(state.copyWith(email: "example@example.com"));
  }

}
