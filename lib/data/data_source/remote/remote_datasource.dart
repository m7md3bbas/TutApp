import 'package:tutapp/data/network/app_api.dart';
import 'package:tutapp/data/network/login_request.dart';
import 'package:tutapp/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login({required LoginRequest loginRequest});
}

class RemoteDataSourceIm implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceIm(this._appServiceClient);
  @override
  Future<AuthenticationResponse> login(
      {required LoginRequest loginRequest}) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }
}
