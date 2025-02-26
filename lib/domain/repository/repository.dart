import 'package:dartz/dartz.dart';
import 'package:tutapp/data/network/failure.dart';
import 'package:tutapp/data/network/login_request.dart';
import 'package:tutapp/domain/models/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login({LoginRequest loginRequest});
}
