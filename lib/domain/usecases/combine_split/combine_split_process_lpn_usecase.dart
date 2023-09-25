import 'package:dartz/dartz.dart';
import 'package:SkyWatch/data/failures/failure.dart';
import 'package:SkyWatch/data/requests/requests.dart';
import 'package:SkyWatch/domain/models/models.dart';
import 'package:SkyWatch/domain/repository/repository.dart';
import '../base_usecase.dart';

class CombineSplitProcessLPNUseCase
    implements
        BaseUseCase<CombineSplitProcessLPNInput, CombineSplitProcessLPN> {
  final Repository repository;
  CombineSplitProcessLPNUseCase(this.repository);
  @override
  Future<Either<Failure, CombineSplitProcessLPN>> execute(
      CombineSplitProcessLPNInput input) async {
    return await repository.processCombineSplitLPN(
        CombineSplitProcessLPNRequest(input.fromLicensePlateNumber,
            input.quantityMoved, input.toLicensePlateNumber));
  }
}

class CombineSplitProcessLPNInput {
  String fromLicensePlateNumber;
  String quantityMoved;
  String toLicensePlateNumber;

  CombineSplitProcessLPNInput(
    this.fromLicensePlateNumber,
    this.quantityMoved,
    this.toLicensePlateNumber,
  );
}
