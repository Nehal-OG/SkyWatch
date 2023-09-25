import 'package:dartz/dartz.dart';
import 'package:SkyWatch/data/failures/failure.dart';
import 'package:SkyWatch/data/requests/requests.dart';
import 'package:SkyWatch/domain/models/models.dart';
import 'package:SkyWatch/domain/repository/repository.dart';

import 'base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Login> {
  final Repository repository;
  LoginUseCase(this.repository);
  @override
  Future<Either<Failure, Login>> execute(LoginUseCaseInput input) async {
    return await repository.login(LoginRequest(input.username, input.password));
  }
}

class LoginUseCaseInput {
  String username;
  String password;
  LoginUseCaseInput(this.username, this.password);
}
