import 'package:dartz/dartz.dart';
import 'package:mackenzie_academy/core/base/usecase/base_usecase.dart';
import 'package:mackenzie_academy/core/error/failure.dart';
import 'package:mackenzie_academy/core/error/failure.dart';
import 'package:mackenzie_academy/features/auth/data/models/register_request.dart';
import 'package:mackenzie_academy/features/auth/data/models/register_response.dart';
import 'package:mackenzie_academy/features/auth/domain/repositories/auth_repository.dart';

class PostRegisterUseCase extends BaseUseCase<RegisterResponse, RegisterRequest> {
  // final BaseRepository _repository;
   final AuthRepository _repository;

  PostRegisterUseCase(this._repository);

  @override
  Future<Either<Failure, RegisterResponse>> call(RegisterRequest parameters) {
    // TODO: implement call
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, RegisterResponse>> call(RegisterRequest params) =>
  //      _repository.register(params);
}