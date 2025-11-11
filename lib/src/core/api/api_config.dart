import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static final String domain = dotenv.env['DOMAIN'].toString();
  static const String serviceApp = 'services/app';
  static const String getValidationPassword = '$serviceApp/Profile/GetPasswordComplexitySetting';
  static const String getEditions = '$serviceApp/TenantRegistration/GetEditionsForSelect';
  static const String isTenantAvailable = '$serviceApp/Account/IsTenantAvailable';
  static const String register = '$serviceApp/TenantRegistration/RegisterTenant';
  static const String login = 'TokenAuth/Authenticate';
  static const String currentLoginInformation = '$serviceApp/Session/GetCurrentLoginInformations';
}