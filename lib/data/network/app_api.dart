import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tutapp/app/constants.dart';
import 'package:tutapp/data/response/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("/customers/login")
  Future<AuthenticationResponse> login(
      @Field('email') String email, @Field('password') String password);
}
