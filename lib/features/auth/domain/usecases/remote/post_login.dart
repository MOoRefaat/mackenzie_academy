import 'package:dartz/dartz.dart';
import 'package:mackenzie_academy/core/base/usecase/base_usecase.dart';
import 'package:mackenzie_academy/core/error/failure.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_request.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_response.dart';
import 'package:mackenzie_academy/features/auth/domain/repositories/auth_repository.dart';

class PostLoginByEmailUseCase extends BaseUseCase<LoginResponse, LoginRequest> {
  final AuthRepository _repository;

  PostLoginByEmailUseCase(this._repository);

  @override
  Future<Either<Failure, LoginResponse>> call(LoginRequest parameters) {
    // TODO: implement call
    throw UnimplementedError();
  }


// @override
// Future<Either<Failure, RegisterResponse>> call(RegisterRequest params) =>
//      _repository.register(params);
}