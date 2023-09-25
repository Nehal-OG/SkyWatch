import 'package:dartz/dartz.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sky_watch/application/extensions.dart';
import 'package:sky_watch/data/failures/failure.dart';
import 'package:sky_watch/presentation/resources/strings_manager.dart';
import '../data_source/remote_data_source.dart';
import '../failures/error_handler.dart';
import '../mappers/mapper.dart';
import '../network/network_info.dart';
import '../requests/requests.dart';
import '../../domain/models/models.dart';
import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final NetworkInfo networkInfo;
  final RemoteDataSource remoteDataSource;
  RepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        EasyLoading.show();
        final response = await remoteDataSource.login(loginRequest);

        EasyLoading.dismiss();

        if (response.username.orEmpty().isNotEmpty) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        EasyLoading.dismiss();
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      EasyLoading.dismiss();
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Logout>> logout(LogoutRequest logoutRequest) async {
    if (await networkInfo.isConnected) {
      try {
        EasyLoading.show();
        final response = await remoteDataSource.logout(logoutRequest);
        EasyLoading.dismiss();
        if (response.status == AppStrings.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        EasyLoading.dismiss();
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      EasyLoading.dismiss();
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  // @override
  // Future<Either<Failure, POReceiptWarehouseOperations>> getOrderDetails(
  //     POReceiptWarehouseRequest poReceiptWarehouseRequest) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       EasyLoading.show();
  //       final response =
  //           await remoteDataSource.getOrderDetails(poReceiptWarehouseRequest);
  //       EasyLoading.dismiss();

  //       if (response.messageResponse != null &&
  //           response.messageResponse!.success == true) {
  //         return Right(response.toDomain());
  //       } else {
  //         return Left(Failure(
  //             ApiInternalStatus.FAILURE,
  //             response.messageResponse?.response.toString() ??
  //                 ResponseMessage.DEFAULT));
  //       }
  //     } catch (error) {
  //       EasyLoading.dismiss();
  //       return Left(ErrorHandler.handle(error).failure);
  //     }
  //   } else {
  //     EasyLoading.dismiss();
  //     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  //   }
  // }

  // // Validate LPN
  // @override
  // Future<Either<Failure, POReceiptLPNValidationOperations>> validateLPN(
  //     POReceiptLPNValidationRequest poReceiptLPNValidationRequest) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       EasyLoading.show();
  //       final response =
  //           await remoteDataSource.validateLPN(poReceiptLPNValidationRequest);
  //       EasyLoading.dismiss();

  //       if (response.messageResponse != null &&
  //           response.messageResponse!.success == true) {
  //         return Right(response.toDomain());
  //       } else {
  //         return Left(Failure(
  //             ApiInternalStatus.FAILURE,
  //             response.messageResponse?.response.toString() ??
  //                 ResponseMessage.DEFAULT));
  //       }
  //     } catch (error) {
  //       EasyLoading.dismiss();
  //       return Left(ErrorHandler.handle(error).failure);
  //     }
  //   } else {
  //     EasyLoading.dismiss();
  //     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, ProcessReceiptPurchase>> processPOReceipt(
  //     ReceiptPurchaseRequest receiptPurchaseRequest) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       EasyLoading.show();
  //       final response =
  //           await remoteDataSource.processPOReceipt(receiptPurchaseRequest);
  //       EasyLoading.dismiss();

  //       if (response.processPoReceiptMessageResponse != null &&
  //           response.processPoReceiptMessageResponse!.success == true) {
  //         return Right(response.toDomain());
  //       } else {
  //         return Left(Failure(
  //             ApiInternalStatus.FAILURE,
  //             response.processPoReceiptMessageResponse?.response
  //                     .toString()
  //                     .replaceAll('[', '')
  //                     .replaceAll(']', '') ??
  //                 ResponseMessage.DEFAULT));
  //       }
  //     } catch (error) {
  //       EasyLoading.dismiss();
  //       return Left(ErrorHandler.handle(error).failure);
  //     }
  //   } else {
  //     EasyLoading.dismiss();
  //     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  //   }
  // }

  // // Pick confirm Repository Driver
  // @override
  // Future<Either<Failure, PickConfirmOperation>> getDriverDetailsPickConfirm(
  //     PickingSuggestionsDashboardRequest
  //         pickingSuggestionsDashboardRequest) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       EasyLoading.show();
  //       final response = await remoteDataSource
  //           .getDriverDetailsPickConfirm(pickingSuggestionsDashboardRequest);
  //       EasyLoading.dismiss();

  //       if (response.messageResponsePickConfirmDriverDetails != null &&
  //           response.messageResponsePickConfirmDriverDetails!.success == true) {
  //         return Right(response.toDomain());
  //       } else {
  //         return Left(Failure(
  //             ApiInternalStatus.FAILURE,
  //             response.messageResponsePickConfirmDriverDetails?.response
  //                     .toString() ??
  //                 ResponseMessage.DEFAULT));
  //       }
  //     } catch (error) {
  //       EasyLoading.dismiss();
  //       return Left(ErrorHandler.handle(error).failure);
  //     }
  //   } else {
  //     EasyLoading.dismiss();
  //     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  //   }
  // }

  /// COMBINE SPLIT
  // Get LPN
  @override
  Future<Either<Failure, CombineSplitLPNInfo>> getCombineSplitLPNInfo(
      CombineSplitLPNInfoRequest lpnInfoRequest) async {
    if (await networkInfo.isConnected) {
      try {
        EasyLoading.show();
        final response =
            await remoteDataSource.getCombineSplitLPNInfo(lpnInfoRequest);
        EasyLoading.dismiss();

        if (response.messageResponse != null &&
            response.messageResponse!.success == true) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              ApiInternalStatus.FAILURE,
              response.messageResponse?.response
                      .toString()
                      .replaceAll('[', '')
                      .replaceAll(']', '') ??
                  ResponseMessage.DEFAULT));
        }
      } catch (error) {
        EasyLoading.dismiss();
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      EasyLoading.dismiss();
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  // New LPN
  @override
  Future<Either<Failure, CombineSplitNewLPN>> getCombineSplitNewLPN(
      CombineSplitNewLPNNumberRequest newLPNNumberRequest) async {
    if (await networkInfo.isConnected) {
      try {
        EasyLoading.show();
        final response =
            await remoteDataSource.getCombineSplitNewLPN(newLPNNumberRequest);
        EasyLoading.dismiss();

        if (response.messageResponse != null &&
            response.messageResponse!.success == true) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              ApiInternalStatus.FAILURE,
              response.messageResponse?.response
                      .toString()
                      .replaceAll('[', '')
                      .replaceAll(']', '') ??
                  ResponseMessage.DEFAULT));
        }
      } catch (error) {
        EasyLoading.dismiss();
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      EasyLoading.dismiss();
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  // Process LPN
  @override
  Future<Either<Failure, CombineSplitProcessLPN>> processCombineSplitLPN(
      CombineSplitProcessLPNRequest processLPNRequest) async {
    if (await networkInfo.isConnected) {
      try {
        EasyLoading.show();
        final response =
            await remoteDataSource.processCombineSplitLPN(processLPNRequest);
        EasyLoading.dismiss();

        if (response.messageResponse != null &&
            response.messageResponse!.success == true) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              ApiInternalStatus.FAILURE,
              response.messageResponse?.response
                      .toString()
                      .replaceAll('[', '')
                      .replaceAll(']', '') ??
                  ResponseMessage.DEFAULT));
        }
      } catch (error) {
        EasyLoading.dismiss();
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      EasyLoading.dismiss();
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
