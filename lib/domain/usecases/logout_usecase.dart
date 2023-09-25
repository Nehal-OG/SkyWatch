import 'package:dartz/dartz.dart';
import 'package:SkyWatch/data/failures/failure.dart';
import 'package:SkyWatch/data/requests/requests.dart';
import 'package:SkyWatch/domain/models/models.dart';
import 'package:SkyWatch/domain/repository/repository.dart';

import 'base_usecase.dart';

class LogoutUseCase implements BaseUseCase<LogoutUseCaseInput, Logout> {
  final Repository repository;
  LogoutUseCase(this.repository);
  @override
  Future<Either<Failure, Logout>> execute(LogoutUseCaseInput input) async {
    return await repository.logout(LogoutRequest(input.token));
  }
}

class LogoutUseCaseInput {
  String token;
  LogoutUseCaseInput(
    this.token,
  );
}
