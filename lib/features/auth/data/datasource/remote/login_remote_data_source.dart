import 'package:dartz/dartz.dart';
import 'package:mackenzie_academy/core/error/failure.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_request.dart';
import 'package:mackenzie_academy/features/auth/data/models/login_response.dart';
import 'package:mackenzie_academy/features/auth/data/models/register_request.dart';
import 'package:mackenzie_academy/features/auth/data/models/register_response.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterResponse> register(
      RegisterRequest registerParams,
      );

  Future<Either<Failure, LoginResponse>> loginByEmail(LoginRequest loginParams);

}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  @override
  Future<Either<Failure, LoginResponse>> loginByEmail(LoginRequest loginParams) async {
    print("1------------ AuthRemoteDatasourceImpl:loginByEmail");
    // TODO: implement loginByEmail
    //       try {
    //         UserCredential? userCredentials = await FirebaseAuth.instance
    //             .createUserWithEmailAndPassword(
    //             email: emailController.text, password: passwordController.text);
    //         createUserDocument(userCredentials);
    //         Navigator.pop(context);
    //         Navigator.of(context).pushReplacementNamed(RoutesName.loginRoute);
    //       } on FirebaseAuthException catch (e) {
    //         Navigator.pop(context);
    //         displayMessageToUser(e.code, context);
    //       }
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerParams) {
    // TODO: implement register
    throw UnimplementedError();
  }

}