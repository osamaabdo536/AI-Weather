import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/feature/auth/register/presentation/register_cubit/register_state.dart';
import '../../../../../../core/Router/app_router.dart';
import '../../../../../../core/utils/custom_elevated_button.dart';
import '../../../../../../core/utils/custom_text_form_filed.dart';
import '../../../../../../core/utils/dialoug_utils.dart';
import '../../../../../../core/utils/text_widget.dart';
import '../../../../../../core/utils/validation/email_validation.dart';
import '../../../../../../core/utils/validation/password_validation.dart';
import '../../register_cubit/register_cubit.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  RegisterCubit viewCubit = RegisterCubit();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      bloc: viewCubit,
      listener: (context, state) {
        if (state is RegisterLoadingState)  {
          DialogUtils.showLoading(context, "Loading...");
          const CircularProgressIndicator();
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMassage,
              posActionName: 'Ok',title: "Something went wrong!");
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, "User sign un successfully!",
              posActionName: "Ok" , title: "Welcome!");
          Future.delayed(const Duration(seconds: 2), () {
            GoRouter.of(context).push(AppRouter.loginView);
          });
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xff004182),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const TextWidget(
                      text: 'Welcome to weather app',
                      size: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Form(
                      key: viewCubit.key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const TextWidget(
                            text: 'Full Name',
                            size: 20,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          CustomTextFormFiled(
                            hintText: 'Enter your full name',
                            controller: viewCubit.fullNameController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please enter your full name";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const TextWidget(
                            text: 'E-mail address',
                            size: 20,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          CustomTextFormFiled(
                            hintText: 'Enter your E-mail',
                            controller: viewCubit.emailController,
                            validator: emailValidation,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const TextWidget(
                            text: 'Password',
                            size: 20,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          CustomTextFormFiled(
                            hintText: 'Enter your password',
                            controller: viewCubit.passwordController,
                            isObscure: viewCubit.isVisible,
                            icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  viewCubit.isVisible = !viewCubit.isVisible;
                                });
                              },
                              icon: Icon(
                                viewCubit.isVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                            ),
                            validator: passwordValidation,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const TextWidget(
                            text: 'Confirmation password',
                            size: 20,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          CustomTextFormFiled(
                            hintText: 'Enter your confirmation password',
                            controller:
                                viewCubit.confirmationPasswordController,
                            isObscure: viewCubit.isConformationVisible,
                            icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  viewCubit.isConformationVisible =
                                      !viewCubit.isConformationVisible;
                                });
                              },
                              icon: Icon(
                                viewCubit.isConformationVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                            ),
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please enter your Password";
                              }
                              if (text != viewCubit.passwordController.text) {
                                return "Your password doesn't match";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          CustomElevatedButton(
                            onPressed: () {
                              viewCubit.register();
                            },
                            text: 'Sing up',
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextWidget(
                                text: "Already have an account?",
                                size: 21,
                              ),
                              InkWell(
                                onTap: () {
                                  GoRouter.of(context)
                                      .push(AppRouter.loginView);
                                },
                                child: const TextWidget(
                                  text: 'Sing in',
                                  size: 21,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
