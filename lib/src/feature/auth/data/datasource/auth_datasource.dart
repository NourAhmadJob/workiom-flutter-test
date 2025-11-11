import 'package:dio/dio.dart';
import 'package:untitled/src/core/api/api_config.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled/src/core/response/api_response.dart';
import 'package:untitled/src/feature/auth/data/model/current_login_information_model.dart';
import 'package:untitled/src/feature/auth/data/model/get_editions_model.dart';
import 'package:untitled/src/feature/auth/data/model/get_password_validation_model.dart';
import 'package:untitled/src/feature/auth/data/model/user_model.dart';
import 'package:untitled/src/feature/auth/domain/entities/current_login_information.dart';
import 'package:untitled/src/feature/auth/domain/entities/user.dart';
import '../../domain/entities/get_editions.dart';
import '../../domain/entities/get_password_validation.dart';
part 'auth_datasource.g.dart';

@RestApi()
abstract class AuthDataSource {
  factory AuthDataSource(Dio dio, {String baseUrl}) = _AuthDataSource;

  @GET(ApiConfig.getValidationPassword)
  Future<ApiResponse<GetPasswordValidationModel>> getPasswordValidation();
  @GET(ApiConfig.getEditions)
  Future<ApiResponse<GetEditionsModel>> getEditions();
  @POST(ApiConfig.isTenantAvailable)
  Future<void> isTenantAvailable(@Body() Map<String,dynamic> body);
  @POST(ApiConfig.register)
  Future<void> register(@Body() Map<String,dynamic> body);
  @POST(ApiConfig.login)
  Future<ApiResponse<UserModel>> login(@Body() Map<String,dynamic> body);
  @GET(ApiConfig.currentLoginInformation)
  Future<ApiResponse<CurrentLoginInformationModel>> getCurrentLoginInformation();
}