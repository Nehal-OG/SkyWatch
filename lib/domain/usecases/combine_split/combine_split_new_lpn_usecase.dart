import 'package:dartz/dartz.dart';
import 'package:sky_watch/data/failures/failure.dart';
import 'package:sky_watch/data/requests/requests.dart';
import 'package:sky_watch/domain/models/models.dart';
import 'package:sky_watch/domain/repository/repository.dart';
import '../base_usecase.dart';

class CombineSplitNewLPNUseCase
    implements BaseUseCase<CombineSplitNewLPNInput, CombineSplitNewLPN> {
  final Repository repository;
  CombineSplitNewLPNUseCase(this.repository);
  @override
  Future<Either<Failure, CombineSplitNewLPN>> execute(
      CombineSplitNewLPNInput input) async {
    return await repository.getCombineSplitNewLPN(
        CombineSplitNewLPNNumberRequest(input.branchPlant));
  }
}

class CombineSplitNewLPNInput {
  String branchPlant;

  CombineSplitNewLPNInput(
    this.branchPlant,
  );
}
