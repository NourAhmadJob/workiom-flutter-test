import 'package:flutter/material.dart';
import 'package:untitled/src/core/utils/app.dart';
import 'package:untitled/src/core/utils/secure_storage.dart';
import 'package:untitled/src/core/utils/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupApp();
  final accessToken = await SecureStorage.getAccessToken();
  runApp(AppBuilder(token: accessToken,));
}