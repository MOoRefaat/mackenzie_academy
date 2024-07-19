import 'package:dartz/dartz.dart';
import 'package:mackenzie_academy/core/error/failure.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_request.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_response.dart';
import 'package:mackenzie_academy/features/auth/data/models/register_response.dart';

abstract class AuthRepository {

  Future<Either<Failure, LoginResponse>> loginByEmail(LoginRequest loginParams);

  Future<Either<Failure, RegisterRequest>> register(RegisterRequest registerParams);

}