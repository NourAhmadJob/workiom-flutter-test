import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:untitled/src/core/dependency_injection/di.dart';
import 'package:untitled/src/core/network/dio_helper.dart';

Future<void> setupApp() async {
  await dotenv.load(fileName: '.env');
  await DioHelper.init();
  configureDependencies();
}
