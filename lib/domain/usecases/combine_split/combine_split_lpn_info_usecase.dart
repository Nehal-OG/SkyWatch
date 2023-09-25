import 'package:dartz/dartz.dart';
import 'package:sky_watch/data/failures/failure.dart';
import 'package:sky_watch/data/requests/requests.dart';
import 'package:sky_watch/domain/models/models.dart';
import 'package:sky_watch/domain/repository/repository.dart';
import '../base_usecase.dart';

class CombineSplitLPNInfoUseCase
    implements BaseUseCase<CombineSplitLPNInfoInput, CombineSplitLPNInfo> {
  final Repository repository;
  CombineSplitLPNInfoUseCase(this.repository);
  @override
  Future<Either<Failure, CombineSplitLPNInfo>> execute(
      CombineSplitLPNInfoInput input) async {
    return await repository.getCombineSplitLPNInfo(
        CombineSplitLPNInfoRequest(input.fromLicensePlateNumber));
  }
}

class CombineSplitLPNInfoInput {
  String fromLicensePlateNumber;

  CombineSplitLPNInfoInput(
    this.fromLicensePlateNumber,
  );
}
