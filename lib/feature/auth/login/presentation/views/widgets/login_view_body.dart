import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/feature/auth/login/presentation/login_cubit/login_cubit.dart';
import 'package:weather/feature/auth/login/presentation/login_cubit/login_states.dart';
import '../../../../../../core/Router/app_router.dart';
import '../../../../../../core/utils/custom_elevated_button.dart';
import '../../../../../../core/utils/custom_text_form_filed.dart';
import '../../../../../../core/utils/dialoug_utils.dart';
import '../../../../../../core/utils/text_widget.dart';
import '../../../../../../core/utils/validation/email_validation.dart';
import '../../../../../../core/utils/validation/password_validation.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  LoginCubit loginCubit = LoginCubit();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      bloc: loginCubit,
  listener: (context, state) {
    if (state is LoginLoadingState)  {
      DialogUtils.showLoading(context, "Loading...");
      const CircularProgressIndicator();
    } else if (state is LoginErrorState) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context, state.errorMessage,
          posActionName: 'Ok',title: "Something went wrong!");
    } else if (state is LoginSuccessState) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context, "User sign in successfully!",
          posActionName: "Ok" , title: "Welcome!");
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const TextWidget(
                  text: 'Welcome back to weather app',
                  size: 24,
                  fontWeight: FontWeight.w600,
                ),
                const TextWidget(
                  text: 'Please sign in with your mail',
                  size: 22,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Form(
                  key: loginCubit.key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const TextWidget(
                        text: 'E-mail address',
                        size: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      CustomTextFormFiled(
                        hintText: 'Enter your E-mail',
                        controller: loginCubit.emailController,
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
                        controller: loginCubit.passwordController,
                        isObscure: loginCubit.isVisible,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              loginCubit.isVisible = !loginCubit.isVisible;
                            });
                          },
                          icon: Icon(
                            loginCubit.isVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                        validator: passwordValidation,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      CustomElevatedButton(
                        onPressed: () {
                          loginCubit.login();
                        },
                        text: 'Sign in',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextWidget(
                            text: "Don't have an account?",
                            size: 21,
                          ),
                          InkWell(
                            onTap: (){
                              GoRouter.of(context).push(AppRouter.registerView);
                            },
                            child: const TextWidget(
                              text: 'Sing up',
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
