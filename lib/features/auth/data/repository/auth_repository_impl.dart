import 'package:dartz/dartz.dart';
import 'package:mackenzie_academy/core/error/failure.dart';
import 'package:mackenzie_academy/features/auth/data/datasource/remote/login_remote_data_source.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_request.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_response.dart';
import 'package:mackenzie_academy/features/auth/data/models/register_response.dart';
import 'package:mackenzie_academy/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  const AuthRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, LoginResponse>> loginByEmail(LoginRequest loginParams) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RegisterRequest>> register(RegisterRequest registerParams) {
    // TODO: implement register
    throw UnimplementedError();
  }

}