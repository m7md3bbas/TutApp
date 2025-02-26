import 'package:dartz/dartz.dart';
import 'package:tutapp/app/constants.dart';
import 'package:tutapp/data/data_source/remote/remote_datasource.dart';
import 'package:tutapp/data/mapper/mapper.dart';
import 'package:tutapp/data/network/failure.dart';
import 'package:tutapp/data/network/login_request.dart';
import 'package:tutapp/data/network/network_info.dart';
import 'package:tutapp/domain/models/models.dart';
import 'package:tutapp/domain/repository/repository.dart';
import 'package:tutapp/presentation/res/strings_manager.dart';

class RepositoryImplemention implements Repository {
  final RemoteDataSourceIm _remoteDataSourceIm;
  final NetworkInfo _networkInfo;
  RepositoryImplemention(this._networkInfo, this._remoteDataSourceIm);

  @override
  Future<Either<Failure, Authentication>> login(
      {required LoginRequest loginRequest}) async {
    if (await _networkInfo.isConnected) {
      final response =
          await _remoteDataSourceIm.login(loginRequest: loginRequest);
      if (response.statusCode == Constants.twohandred) {
        return Right(response.toDomain());
      }
      {
        return Left(Failure(
            code: Constants.fivehandredandOne,
            message: response.message ?? StringsManager.pleaseTryAgain));
      }
    } else {
      return Left(Failure(
          message: StringsManager.noInernetConection,
          code: Constants.fivehandredandOne));
    }
  }
}
