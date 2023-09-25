// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:SkyWatch/presentation/resources/color_manager.dart';
import 'package:SkyWatch/presentation/resources/styles_manager.dart';
import 'package:SkyWatch/presentation/resources/values_manager.dart';

Padding CustomTextField({
  required String hintText,
  String? suffixIconAssetPath,
  IconData? suffixIconName,
  VoidCallback? onSuffixIconPressed,
  TextEditingController? controller,
  bool? obscureText,
  void Function(String)? onChanged,
  bool disabled = false,
  bool isLastTextField = false,
  void Function(String)? onSubmitted,
  double? bottomPadding,
  TextInputType? keyboardType,
  int? maxLines,
  int? minLines,
  double? textFontSize,
  double? maxHeight,
  VoidCallback? onTap,
  String? suffixText,
  FocusNode? focusNode,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: bottomPadding ?? AppPaddings.p16),
    child: TextField(
      focusNode: focusNode,
      // enableInteractiveSelection: false,
      textCapitalization: TextCapitalization.characters,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: disabled,
      obscureText: obscureText ?? false,
      controller: controller,
      onChanged: onChanged,
      style: getTextFieldTextStyle(fontSize: textFontSize),
      textInputAction:
          isLastTextField ? TextInputAction.done : TextInputAction.next,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        suffixText: suffixText,

        suffixStyle: getTextFieldSuffixTextStyle(
          fontSize: textFontSize,
          textBaseline: TextBaseline.ideographic,
        ),
        contentPadding: const EdgeInsets.only(bottom: 4, left: 5, top: 4),
        //hintText: hintText,
        constraints: BoxConstraints(maxHeight: maxHeight ?? AppSizes.s50),
        filled: disabled,
        enabled: !disabled,
        border: disabled
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.r10),
              )
            : null,
        fillColor:
            disabled ? ColorManager.disabledBackgroundTextFieldColor : null,
        labelText: hintText,
        suffixIcon: (suffixIconAssetPath != null)
            ? IconButton(
                onPressed: onSuffixIconPressed,
                icon: SvgPicture.asset(
                  suffixIconAssetPath,
                  width: AppSizes.s25,
                  height: AppSizes.s25,
                  color: ColorManager.primary,
                ),
              )
            : (suffixIconName != null)
                ? IconButton(
                    onPressed: onSuffixIconPressed,
                    icon: Icon(suffixIconName),
                  )
                : null,
        suffixIconConstraints: const BoxConstraints(
          minWidth: AppSizes.s25,
          minHeight: AppSizes.s25,
        ),
      ),
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
    ),
  );
}

Row CustomTwoTextField({
  required String hintOneText,
  String? suffixIconOneAssetPath,
  VoidCallback? onSuffixIconOnePressed,
  TextEditingController? controllerOne,
  bool? obscureTextOne,
  FocusNode? focusNodeOne,
  void Function(String)? onTextOneChanged,
  bool textOneDisabled = false,
  String? suffixTextOne,
  TextInputType? keyboardTypeOne,
  required String hintTwoText,
  String? suffixIconTwoAssetPath,
  VoidCallback? onSuffixIconTwoPressed,
  TextEditingController? controllerTwo,
  bool? obscureTextTwo,
  void Function(String)? onTextTwoChanged,
  bool textTwoDisabled = false,
  String? suffixTextTwo,
  FocusNode? focusNodeTwo,
  bool isLastTextField = false,
  void Function(String)? onSubmitted,
  TextInputType? keyboardTypeTwo,
}) {
  return Row(
    children: [
      Expanded(
        child: CustomTextField(
          hintText: hintOneText,
          suffixIconAssetPath: suffixIconOneAssetPath,
          onSuffixIconPressed: onSuffixIconOnePressed,
          controller: controllerOne,
          obscureText: obscureTextOne,
          onChanged: onTextOneChanged,
          disabled: textOneDisabled,
          suffixText: suffixTextOne,
          keyboardType: keyboardTypeOne,
          focusNode: focusNodeOne,
        ),
      ),
      const SizedBox(
        width: AppSizes.s20,
      ),
      Expanded(
        child: CustomTextField(
          hintText: hintTwoText,
          suffixIconAssetPath: suffixIconTwoAssetPath,
          onSuffixIconPressed: onSuffixIconTwoPressed,
          controller: controllerTwo,
          obscureText: obscureTextTwo,
          onChanged: onTextTwoChanged,
          disabled: textTwoDisabled,
          isLastTextField: isLastTextField,
          onSubmitted: onSubmitted,
          suffixText: suffixTextTwo,
          keyboardType: keyboardTypeTwo,
          focusNode: focusNodeTwo,
        ),
      ),
    ],
  );
}
