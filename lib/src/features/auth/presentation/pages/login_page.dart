import 'package:destinaku/src/core/helper/ui_theme_extention.dart';
import 'package:destinaku/src/core/router/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/form_validator.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/constant/app_constants.dart';
import '../../../../core/utils/injections.dart';
import '../../../../shared/presentation/snackbar/base_snackbar.dart';
import '../../../../shared/presentation/widgets/app_button.dart';
import '../../../../shared/presentation/widgets/app_text_field.dart';
import '../../data/models/user_model.dart';
import '../../domain/usecase/login_usecase.dart';
import '../bloc/login_bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool isShow = false;

    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: SvgPicture.asset(
            '${assets}auth/login_2.svg',
            height: .6.sh,
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(24).w,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Form(
              key: formKey,
              child: BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(sl<LoginUseCase>()),
                child: BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      showSnackBar(context, text: 'Gagal Login');
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Login',
                            style: context.regular.copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text('Email', style: context.label),
                          const SizedBox(height: 8),
                          AppTextField(
                            controller: emailController,
                            hintText: 'Masukkan email kamu disini',
                            validator: FormValidator.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.none,
                            preffix: Icon(
                              Icons.email,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          Text('Kata sandi', style: context.label),
                          const SizedBox(height: 8),
                          StatefulBuilder(builder: (context, setState) {
                            return AppTextField(
                              controller: passwordController,
                              hintText: 'Masukkan kata sandi kamu disini',
                              obscureText: !isShow,
                              validator: FormValidator.validatePassword,
                              maxLines: 1,
                              keyboardType: TextInputType.visiblePassword,
                              preffix: Icon(
                                Icons.lock_outlined,
                                color: Colors.blue.shade700,
                              ),
                              suffix: IconButton(
                                icon: Icon(
                                  isShow ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                                  color: Colors.blue.shade700,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isShow = !isShow;
                                  });
                                },
                              ),
                            );
                          }),
                          const SizedBox(height: 16),
                          AppButton(
                            text: 'Login',
                            isLoading: (state is LoginLoading),
                            onSubmit: () {
                              if (!formKey.currentState!.validate()) return;
                              context.read<LoginBloc>().add(
                                    RequestLoginEvent(
                                        user: UserModel(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    )),
                                  );
                              if (state is LoginSuccess) context.pushReplacement(AppRoute.home);
                            },
                          ),
                          const SizedBox(height: 16),
                          Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              text: 'Belum Punya Akun ? ',
                              style: context.regular.copyWith(color: AppColors.textSecondary),
                              children: [
                                TextSpan(
                                  text: 'Register Disini',
                                  style: context.regular.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textSecondary,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.push(AppRoute.register);
                                    },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.paddingOf(context).bottom,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
