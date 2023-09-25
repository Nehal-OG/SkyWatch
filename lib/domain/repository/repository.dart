import 'package:dartz/dartz.dart';
import 'package:sky_watch/data/failures/failure.dart';
import 'package:sky_watch/domain/models/models.dart';
import '../../data/requests/requests.dart';

abstract class Repository {
  Future<Either<Failure, Login>> login(LoginRequest loginRequest);
  Future<Either<Failure, Logout>> logout(LogoutRequest logoutRequest);

  /// Sample

  // Future<Either<Failure, POReceiptWarehouseOperations>> getOrderDetails(
  //     POReceiptWarehouseRequest poReceiptWarehouseRequest);
  // // LPN VAlidation
  // Future<Either<Failure, POReceiptLPNValidationOperations>> validateLPN(
  //     POReceiptLPNValidationRequest poReceiptLPNValidationRequest);

  // Future<Either<Failure, ProcessReceiptPurchase>> processPOReceipt(
  //     ReceiptPurchaseRequest receiptPurchaseRequest);
  // //

  /// COMBINE SPLIT
  // Get LPN
  Future<Either<Failure, CombineSplitLPNInfo>> getCombineSplitLPNInfo(
      CombineSplitLPNInfoRequest lpnInfoRequest);
  // New LPN
  Future<Either<Failure, CombineSplitNewLPN>> getCombineSplitNewLPN(
      CombineSplitNewLPNNumberRequest newLPNNumberRequest);
  // Process LPN
  Future<Either<Failure, CombineSplitProcessLPN>> processCombineSplitLPN(
      CombineSplitProcessLPNRequest processLPNRequest);
}
