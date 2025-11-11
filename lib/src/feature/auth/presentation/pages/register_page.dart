import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/utils/functions.dart';
import 'package:untitled/src/core/utils/images.dart';
import 'package:untitled/src/core/utils/navigation.dart';
import 'package:untitled/src/core/widgets/app_loading.dart';
import 'package:untitled/src/feature/auth/presentation/pages/register_step_2_page.dart';
import '../../../../core/theme/app_padding.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/utils/bottom_bar_widget.dart';
import '../../../../core/utils/main_button_widget.dart';
import '../../../../core/widgets/appbar_back_icon_widget.dart';
import '../../../../core/widgets/appbar_title_widget.dart';
import '../../../../core/widgets/title_with_text_field_widget.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/password_strength_indicator.dart';
import '../widgets/password_validation_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _currentPassword = '';
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
    _authBloc.add(GetPasswordValidationEvent());

    _authBloc.passwordController.addListener(() {
      setState(() {
        _currentPassword = _authBloc.passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is EditionsSuccessState) {
              to(context, RegisterStep2Page());
            } else if (state is EditionsErrorState) {
              showNotification(state.message, isError: true);
            }
          },
          child: Padding(
            padding: AppPadding.appPadding.copyWith(top: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarBackIconWidget(),
                19.verticalSpace,
                AppbarTitleWidget(title: 'Enter a strong password'),
                30.verticalSpace,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleWithTextFieldWidget(
                          title: 'Your work email',
                          image: SvgImages.email,
                          controller: _authBloc.emailController,
                          hint: 'Your work email',
                          suffixIcon: SvgImages.closeCircle,
                          onPressedSuffixIcon: () {
                            _authBloc.emailController.clear();
                          },
                        ),
                        24.verticalSpace,
                        TitleWithTextFieldWidget(
                          title: 'Your password',
                          image: SvgImages.lock,
                          controller: _authBloc.passwordController,
                          hint: 'Your password',
                          showVisibilityToggle: true,
                          suffixIcon: SvgImages.closeCircle,
                          onPressedSuffixIcon: () {},
                        ),
                        12.verticalSpace,
                        if (_currentPassword.isNotEmpty)
                          PasswordStrengthIndicator(
                            liner: _authBloc.calculatePasswordStrength(
                              _currentPassword,
                            ),
                          ),
                        20.verticalSpace,
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is PasswordValidationLoadingState) {
                              return const AppLoading();
                            }
                            if (state is PasswordValidationErrorState) {
                              return Text(
                                'Error loading validation rules',
                                style: getRegularStyle(
                                  fontSize: 13.sp,
                                  color: Colors.red,
                                ),
                              );
                            }

                            return PasswordValidationWidget(
                              settingProfile: _authBloc.settingProfile,
                              currentPassword: _currentPassword,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final isLoading = state is EditionsLoadingState;

                    if (!_authBloc.isPasswordValid(_currentPassword)) {
                      return MainButtonWidget(
                        title: 'Confirm password',
                        onPress: null,
                        isMainColor: false,
                      );
                    }

                    return MainButtonWidget(
                      title: 'Confirm password',
                      onPress: () {
                        if (!_authBloc.isEmailValid(
                          _authBloc.emailController.text,
                        )) {
                          showNotification('Enter valid email', isError: true);
                          return;
                        }
                        print('== 1 ');
                        if (_authBloc.isPasswordValid(_currentPassword)) {
                          _authBloc.add(GetEditionsEvent());
                        }
                      },
                      isMainColor: true,
                      isLoading: isLoading,
                    );
                  },
                ),
                20.verticalSpace,
                BottomBarWidget(withLang: false),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
