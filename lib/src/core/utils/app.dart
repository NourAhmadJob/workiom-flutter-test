import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/src/core/dependency_injection/di.dart';
import 'package:untitled/src/feature/auth/presentation/pages/check_user_logged_page.dart';
import 'package:untitled/src/feature/auth/presentation/pages/home_page.dart';
import 'package:untitled/src/feature/auth/presentation/pages/login_page.dart';

import '../../feature/auth/presentation/bloc/auth_bloc.dart';
import '../theme/theme.dart';

class AppBuilder extends StatelessWidget {
  const AppBuilder({super.key , required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: Builder(
        builder: (context) {
          return ScreenUtilInit(
            designSize: const Size(375, 829),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'App-Builder',
                builder: FToastBuilder(),
                themeMode: ThemeMode.light,
                darkTheme: AppTheme.darkTheme(),
                theme: AppTheme.lightTheme(),
                home: token != 'null'?  HomePage() : CheckUserLoggedPage(),
              );
            },
          );
        },
      ),
    );
  }
}
