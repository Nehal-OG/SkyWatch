// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SkyWatch/presentation/resources/color_manager.dart';
import 'package:SkyWatch/presentation/resources/styles_manager.dart';
import 'package:SkyWatch/presentation/resources/values_manager.dart';
import 'package:SkyWatch/presentation/widgets/custom_button.dart';
import 'package:SkyWatch/presentation/widgets/custom_text.dart';
import 'custom_divider.dart';

Dialog CustomConfirmationDialog({
  String message = '',
  required String headlineMessage,
  String errorTitle = '',
  required String confirmationButtonText,
  String? denieButtonText,
  required VoidCallback onConfirmation,
  VoidCallback? onDenied,
  bool showErrorIcon = false,
}) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    backgroundColor: ColorManager.white,
    elevation: AppSizes.s10,
    child: Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showErrorIcon) ...[
            const Icon(
              Icons.error,
              color: Color(0XFFF29E00),
              size: AppSizes.s50,
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomText(
              errorTitle,
              textStyle: getDialogTextStyle(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomDivider(),
          ],
          const SizedBox(
            height: 20.0,
          ),
          CustomText(
            headlineMessage,
            textStyle: getDialogTextStyle(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20.0,
          ),
          if (showErrorIcon) ...[
            CustomText(
              message,
              textStyle: getErrorMessageTextStyle(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
          denieButtonText != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      confirmationButtonText,
                      onPressed: onConfirmation,
                      buttonWidth: AppSizes.s100,
                    ),
                    CustomButton(
                      denieButtonText,
                      onPressed: onDenied ?? Get.back,
                      buttonWidth: AppSizes.s100,
                      greyBackground: true,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      confirmationButtonText,
                      onPressed: onConfirmation,
                      buttonWidth: AppSizes.s100,
                    ),
                  ],
                ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    ),
  );
}

Dialog CustomTwoConfirmationDialog({
  String message = '',
  required String headlineMessage,
  String errorTitle = '',
  required String confirmationButtonText,
  String? denieButtonText,
  required VoidCallback onConfirmation,
  VoidCallback? onDenied,
  bool showErrorIcon = false,
}) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    backgroundColor: ColorManager.white,
    elevation: AppSizes.s10,
    child: Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showErrorIcon) ...[
            const Icon(
              Icons.error,
              color: Color(0XFFF29E00),
              size: AppSizes.s50,
            ),
          ],
          const SizedBox(
            height: 20.0,
          ),
          CustomText(
            headlineMessage,
            textStyle: getDialogTextStyle(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10.0,
          ),
          if (showErrorIcon) ...[
            CustomText(
              message,
              textStyle: getErrorMessageTextStyle(),
              textAlign: TextAlign.center,
            ),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                confirmationButtonText,
                onPressed: onConfirmation,
                buttonWidth: AppSizes.s100,
              ),
              if (denieButtonText != null)
                CustomButton(
                  denieButtonText,
                  onPressed: onDenied ?? Get.back,
                  buttonWidth: AppSizes.s100,
                  greyBackground: true,
                ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    ),
  );
}
