import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ptma_flutter_client/domain/interactor/auth_interactor.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthInteractor _authInteractor;

  LoginCubit(this._authInteractor) : super(Default());

  void login(String email, String password) async {
    emit(Loading());
    try {
      await _authInteractor.login(email, password);
      emit(LoggedIn());
    } on Exception catch (e) {
      print("Login has failed: ${e.toString()}");
      emit(LoginFailed());
    }
  }
}
