import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/theme/app_padding.dart';
import 'package:untitled/src/core/theme/colors.dart';
import 'package:untitled/src/core/theme/styles.dart';
import 'package:untitled/src/core/utils/functions.dart';
import 'package:untitled/src/core/utils/navigation.dart';
import 'package:untitled/src/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:untitled/src/feature/auth/presentation/pages/login_page.dart';
import 'package:untitled/src/feature/auth/presentation/pages/register_page.dart';

class CheckUserLoggedPage extends StatefulWidget {
  CheckUserLoggedPage({super.key});

  @override
  State<CheckUserLoggedPage> createState() => _CheckUserLoggedPageState();
}

class _CheckUserLoggedPageState extends State<CheckUserLoggedPage> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();

    _authBloc.add(GetCurrentLoginInformationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is GetCurrentLoginInformationSuccessState) {
            if (state.currentLoginInformation.user == null) {
              toAndFinish(context, LoginPage());
            }
            if (state.currentLoginInformation.tenant == null &&
                state.currentLoginInformation.user != null) {
              toAndFinish(context, LoginPage());
            }
          }
            if(state is GetCurrentLoginInformationErrorState) {
             showNotification(state.message , isError: true);
            }
            if(state is GetCurrentLoginInformationLoadingState) {
              setupSpinKitDialog(context);
            }
        },
        child: Padding(
          padding: AppPadding.appPadding,
          child: Center(
            child: Text(
              'Check if User is null Or Tenant is null',
              style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
            ),
          ),
        ),
      ),
    );
  }
}
