import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/core/uitils/text_widget.dart';
import 'package:weather/core/uitils/validation/email_validation.dart';
import 'package:weather/core/uitils/validation/password_validation.dart';

import '../../../../../../core/Router/app_router.dart';
import '../../../../../../core/uitils/custom_elevated_button.dart';
import '../../../../../../core/uitils/custom_text_form_filed.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  var key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();
  bool isVisible = true;
  bool isConformationVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff004182),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const TextWidget(
                text: 'Welcome to weather app',
                size: 28,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Form(
                key: key,
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
                      controller: emailController,
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
                      controller: passwordController,
                      isObscure: isVisible,
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(
                          isVisible
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
                      controller: confirmationPasswordController,
                      isObscure: isConformationVisible,
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            isConformationVisible = !isConformationVisible;
                          });
                        },
                        icon: Icon(
                          isConformationVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your Password";
                        }
                        if (text != passwordController.text) {
                          return "Your password doesn't match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        register();
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
                          onTap: (){
                            GoRouter.of(context).push(AppRouter.loginView);
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
    );
  }

  void register() {
    if (key.currentState?.validate() == true) {}
  }
}
