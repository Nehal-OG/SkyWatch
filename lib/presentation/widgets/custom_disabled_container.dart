// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:SkyWatch/presentation/resources/color_manager.dart';
import 'package:SkyWatch/presentation/resources/styles_manager.dart';
import 'package:SkyWatch/presentation/resources/values_manager.dart';
import 'package:SkyWatch/presentation/widgets/custom_text.dart';

Widget CustomDisabledContainer({
  required String floatingLabelText,
  required String text,
  TextStyle? textStyle,
  String? textLineTwo,
  TextStyle? textStyleTwo,
  String? textLineThree,
  TextStyle? textStyleThree,
}) {
  return Container(
    width: double.maxFinite,
    padding: const EdgeInsets.all(AppPaddings.p16),
    decoration: BoxDecoration(
      color: ColorManager.disabledBackgroundTextFieldColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          floatingLabelText,
          textStyle: getFloatingLabelTextStyle(),
        ),
        const SizedBox(
          height: AppPaddings.p8,
        ),
        CustomText(text, textStyle: textStyle ?? getCustomTextFieldTextStyle()),
        if (textLineTwo != null) ...[
          const SizedBox(
            height: AppPaddings.p8,
          ),
          CustomText(
            textLineTwo,
            textStyle: textStyleTwo ?? getCustomTextFieldTextStyle(),
          ),
        ],
        if (textLineThree != null) ...[
          const SizedBox(
            height: AppPaddings.p8,
          ),
          CustomText(
            textLineThree,
            textStyle: textStyleThree ?? getCustomTextFieldTextStyle(),
          ),
        ],
      ],
    ),
  );
}
