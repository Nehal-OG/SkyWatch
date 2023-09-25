import 'package:dartz/dartz.dart';
import 'package:sky_watch/data/failures/failure.dart';
import 'package:sky_watch/data/requests/requests.dart';
import 'package:sky_watch/domain/models/models.dart';
import 'package:sky_watch/domain/repository/repository.dart';

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
