import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/utils/functions.dart';
import 'package:untitled/src/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:untitled/src/feature/auth/presentation/pages/home_page.dart';

import '../../../../core/theme/app_padding.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/utils/bottom_bar_widget.dart';
import '../../../../core/utils/images.dart';
import '../../../../core/utils/main_button_widget.dart';
import '../../../../core/widgets/app_loading.dart';
import '../../../../core/widgets/appbar_back_icon_widget.dart';
import '../../../../core/widgets/appbar_title_widget.dart';
import '../../../../core/widgets/title_with_text_field_widget.dart';

class RegisterStep2Page extends StatefulWidget {
  const RegisterStep2Page({super.key});

  @override
  State<RegisterStep2Page> createState() => _RegisterStep2PageState();
}

class _RegisterStep2PageState extends State<RegisterStep2Page> {
  late AuthBloc _authBloc;

  String _tenantName = '';
  String _firstName = '';
  String _lastName = '';

  bool _isTenantNameValid = false;
  bool _isFirstNameValid = false;
  bool _isLastNameValid = false;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();

    _authBloc.tenantNameController.addListener(() {
      setState(() {
        _tenantName = _authBloc.tenantNameController.text.trim();
        _isTenantNameValid = _validateTenantName(_tenantName);
      });
    });

    _authBloc.firstNameController.addListener(() {
      setState(() {
        _firstName = _authBloc.firstNameController.text.trim();
        _isFirstNameValid = _validateName(_firstName);
      });
    });

    _authBloc.lastNameController.addListener(() {
      setState(() {
        _lastName = _authBloc.lastNameController.text.trim();
        _isLastNameValid = _validateName(_lastName);
      });
    });
  }

  bool _validateTenantName(String value) {
    if (value.isEmpty) return false;
    return value.length >= 3 && RegExp(r'^[a-zA-Z0-9-]+$').hasMatch(value);
  }

  bool _validateName(String value) {
    return value.isNotEmpty;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is CheckTenantAvailableSuccessState) {
            _authBloc.add(RegisterTenantEvent(body: _authBloc.body));
          }
          if (state is CheckTenantAvailableErrorState) {
            showNotification(state.message, isError: true);
          }
          if (state is RegisterTenantSuccessState) {
            _authBloc.add(LoginTenantEvent(body: _authBloc.loginBody));
          }
          if (state is LoginTenantSuccessState) {
            _authBloc.add(GetCurrentLoginInformationEvent());
          }
          if (state is GetCurrentLoginInformationSuccessState) {
            if (state.currentLoginInformation.user != null &&
                state.currentLoginInformation.tenant != null) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage()),
                (p) => false,
              );
            }
          }
          if(state is GetCurrentLoginInformationErrorState) {
            showNotification(state.message , isError: true);
          }
          if (state is RegisterTenantErrorState) {
            showNotification(state.message, isError: true);
          }
          if (state is LoginTenantErrorState) {
            showNotification(state.message, isError: true);
          }
        },
        child: SafeArea(
          child: Padding(
            padding: AppPadding.appPadding.copyWith(top: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarBackIconWidget(),
                19.verticalSpace,
                AppbarTitleWidget(title: 'Enter your company name'),
                30.verticalSpace,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleWithTextFieldWidget(
                          title: 'Your company or team name',
                          image: SvgImages.community,
                          controller: _authBloc.tenantNameController,
                          hint: 'Workspace name*',
                          suffixIcon: null,
                          suffixText: '.workiom.com',
                        ),
                        24.verticalSpace,
                        TitleWithTextFieldWidget(
                          title: 'Your first name',
                          image: SvgImages.menu,
                          controller: _authBloc.firstNameController,
                          hint: 'Enter your First name',
                        ),
                        24.verticalSpace,
                        TitleWithTextFieldWidget(
                          title: 'Your last name',
                          image: SvgImages.menu,
                          controller: _authBloc.lastNameController,
                          hint: 'Enter your Last name',
                        ),
                        28.verticalSpace,
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            final isLoading =
                                state is CheckTenantAvailabilityLoadingState ||
                                state is RegisterTenantLoadingState ||
                                state is LoginTenantLoadingState ||
                                state is GetCurrentLoginInformationLoadingState;

                            return MainButtonWidget(
                              title: 'Create Workspace',
                              onPress:
                                  _isFirstNameValid &&
                                      _isLastNameValid &&
                                      _isTenantNameValid
                                  ? () {
                                      _authBloc.add(
                                        CheckTenantAvailabilityEvent(
                                          tenancyName: _authBloc
                                              .tenantNameController
                                              .text,
                                        ),
                                      );
                                    }
                                  : null,
                              isMainColor:
                                  _isFirstNameValid &&
                                      _isLastNameValid &&
                                      _isTenantNameValid
                                  ? true
                                  : false,
                              isLoading: isLoading,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
