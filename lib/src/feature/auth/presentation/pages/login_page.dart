import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/theme/app_padding.dart';
import 'package:untitled/src/core/theme/colors.dart';
import 'package:untitled/src/core/theme/styles.dart';
import 'package:untitled/src/core/utils/bottom_bar_widget.dart';
import 'package:untitled/src/core/utils/main_button_widget.dart';
import 'package:untitled/src/core/utils/main_button_widget.dart';
import 'package:untitled/src/core/utils/navigation.dart';
import 'package:untitled/src/core/utils/term_of_use_widget.dart';
import 'package:untitled/src/core/widgets/image_widget.dart';
import 'package:untitled/src/core/widgets/main_button.dart';
import 'package:untitled/src/core/widgets/sign_in_with_google_widget.dart';
import 'package:untitled/src/feature/auth/presentation/pages/register_page.dart';

import '../../../../core/utils/images.dart';
import '../../../../core/widgets/appbar_back_icon_widget.dart';
import '../../../../core/widgets/appbar_title_widget.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.appPadding.copyWith(top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  AppbarBackIconWidget(title: 'Sign in'),
                  19.verticalSpace,
                  AppbarTitleWidget(title: 'Create your free account'),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SignInWithGoogleWidget(),
                  30.verticalSpace,
                  Align(
                    alignment: Alignment.center,
                    child: Text('Or', style: getRegularStyle(fontSize: 12.sp)),
                  ),
                  30.verticalSpace,
                  MainButtonWidget(
                    title: 'Continue with email',
                    onPress: () {
                      to(context, RegisterPage());
                    },
                  ),
                  16.verticalSpace,
                  TermOfUseWidget(),
                ],
              ),
            ),
            BottomBarWidget(withLang: true),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
