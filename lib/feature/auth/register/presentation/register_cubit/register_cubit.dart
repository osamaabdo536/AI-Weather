import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/feature/auth/register/domain/repos/register_repo.dart';
import 'package:weather/feature/auth/register/presentation/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  var key = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();
  bool isVisible = true;
  bool isConformationVisible = true;
  final RegisterRepo registerRepo = GetIt.instance<RegisterRepo>();

  RegisterCubit():super(RegisterInitialState());

  Future<void> register() async {
    if (key.currentState?.validate() == true) {
      try {
        emit(RegisterLoadingState());

        var response = await registerRepo.register(
          fullNameController.text,
          emailController.text,
          passwordController.text,
          confirmationPasswordController.text,
        );

        if (response?.user?.uid != null) {
          emit(RegisterSuccessState());
        } else {
          emit(RegisterErrorState(response.toString()));
        }
      } catch (e) {
        emit(RegisterErrorState("Something went wrong!!"));
      }
    }
  }
}
