import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theme/colors.dart';


void setupSpinKitDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) =>
    Center(child: SpinKitThreeBounce(color: AppColors.primary)),
  );
}

showNotification(String message, {bool isError = false}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: isError ? Colors.red : AppColors.primary,
    textColor: Colors.white,
    fontSize: 16.0.sp,
  );
}

Widget setupSpinKitWidget() {
  return Center(
    child: SpinKitThreeBounce(size: 20.sp, color: AppColors.white),
  );
}

