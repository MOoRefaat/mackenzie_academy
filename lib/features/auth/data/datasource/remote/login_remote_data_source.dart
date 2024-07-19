import 'package:dartz/dartz.dart';
import 'package:mackenzie_academy/core/error/failure.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_request.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_response.dart';
import 'package:mackenzie_academy/features/auth/data/models/register_request.dart';
import 'package:mackenzie_academy/features/auth/data/models/register_response.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, RegisterResponse>> register(
      RegisterRequest registerParams,
      );

  Future<Either<Failure, LoginResponse>> loginByEmail(LoginRequest loginParams);

}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {

  @override
  Future<Either<Failure, LoginResponse>> loginByEmail(LoginRequest loginParams) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RegisterResponse>> register(RegisterRequest registerParams) {
    // TODO: implement register
    throw UnimplementedError();
  }

}