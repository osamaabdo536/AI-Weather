import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/feature/auth/login/domain/repos/login_repo.dart';
import 'package:weather/feature/auth/login/presentation/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = true;
  var key = GlobalKey<FormState>();
  final LoginRepo loginRepo = GetIt.instance<LoginRepo>();
  LoginCubit() : super(LoginInitialState());

  Future<void> login() async {
    if (key.currentState?.validate() == true) {
      emit(LoginLoadingState());

      try {
        var result = await loginRepo.login(
          emailController.text,
          passwordController.text,
        );

        if (result?.user != null) {
          emit(LoginSuccessState());
        } else {
          emit(LoginErrorState('Sign in failed'));
        }
      } catch (e) {
        emit(LoginErrorState("An error occurred during sign in"));
      }
    }
  }
}
