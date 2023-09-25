import 'package:sky_watch/presentation/resources/strings_manager.dart';
import 'package:sky_watch/presentation/widgets/custom_scaffold.dart';
import 'package:sky_watch/presentation/widgets/custom_text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sky_watch/presentation/pages/home_screen/home_screen_view_model.dart';
import 'package:sky_watch/presentation/resources/assets_manager.dart';
import 'package:sky_watch/presentation/resources/color_manager.dart';
import 'package:sky_watch/presentation/resources/constants_manager.dart';
import 'package:sky_watch/presentation/resources/font_manager.dart';
import 'package:sky_watch/presentation/resources/route_manager.dart';
import 'package:sky_watch/presentation/resources/styles_manager.dart';
import 'package:sky_watch/presentation/resources/values_manager.dart';
import 'package:sky_watch/presentation/widgets/custom_button.dart';
import 'package:sky_watch/presentation/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Get.find<HomeScreenViewModel>();

    return CustomScaffold(context,
        scaffoldPadding: AppPaddings.p30,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSizes.sZero,
          actions: [
            IconButton(
              onPressed: () => Get.toNamed(Routes.settingsRoute),
              icon: const Icon(
                Icons.settings,
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    ImageAssets.splashLogo,
                    width: AppSizes.s125,
                    height: AppSizes.s100,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  height: AppSizes.s40,
                ),
                CustomTextField(
                  controller: loginViewModel.usernameController,
                  hintText: AppStrings.username,
                  suffixIconAssetPath: ImageAssets.userName,
                ),
                const SizedBox(
                  height: AppSizes.s8,
                ),
                Obx(
                  () => CustomTextField(
                    controller: loginViewModel.passwordController,
                    hintText: AppStrings.password,
                    // suffixIconAssetPath: loginViewModel.showPassword.value,
                    // ? ImageAssets.visibility
                    // : ImageAssets.visibilityOff,
                    obscureText: !loginViewModel.showPassword.value,
                    onSuffixIconPressed: () => loginViewModel.showPassword
                        .value = !loginViewModel.showPassword.value,
                    isLastTextField: true,
                    // onSubmitted: (value) => loginViewModel.login(),
                  ),
                ),
                Obx(() {
                  Widget widget = const SizedBox();
                  if (loginViewModel.showError.value) {
                    widget = Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: AppSizes.s6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: CustomText(
                            loginViewModel.errorText.value,
                            textStyle: getErrorTextStyle(),
                            maxLines: 2,
                          ),
                        )
                      ],
                    );
                  }
                  return widget;
                }),
                const SizedBox(
                  height: AppSizes.s60,
                ),
                CustomButton(
                  AppStrings.next,
                  // onPressed: () => loginViewModel.login(),
                  onPressed: (() {}),
                  greyBackground: false,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPaddings.p12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                AppStrings.envPye,
                textStyle: getGraphikTextStyle(
                    textColor: ColorManager.envTextColor,
                    fontSize: FontSizeManager.s10),
              ),
              AutoSizeText.rich(TextSpan(
                  style: getGraphikTextStyle(fontSize: FontSizeManager.s11),
                  children: <TextSpan>[
                    const TextSpan(
                      text: AppStrings.sky_watchApp,
                    ),
                    TextSpan(
                        text:
                            ' ${AppStrings.appVersionText} ${AppConstants.appVersion}',
                        style: getGraphikTextStyle(
                            fontSize: FontSizeManager.s11,
                            fontWeight: FontWeightManager.graphikMedium)),
                  ])),
            ],
          ),
        ));
  }
}
