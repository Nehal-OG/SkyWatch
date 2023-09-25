import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:SkyWatch/domain/models/models.dart';
import 'package:SkyWatch/presentation/pages/dashboard/dashboard_view_model.dart';
import 'package:SkyWatch/presentation/resources/assets_manager.dart';
import 'package:SkyWatch/presentation/resources/color_manager.dart';
import 'package:SkyWatch/presentation/resources/constants_manager.dart';
import 'package:SkyWatch/presentation/resources/route_manager.dart';
import 'package:SkyWatch/presentation/resources/styles_manager.dart';
import 'package:SkyWatch/presentation/resources/values_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../../presentation/widgets/custom_scaffold.dart';
import '../../../presentation/widgets/custom_text.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardViewModel = Get.find<DashboardViewModel>();

    var size = MediaQuery.of(context).size;
    // change itemHeight from 125 to 50
    const double itemHeight = AppSizes.s50;
    final double itemWidth = size.width / 2;

    return CustomScaffold(
      context,
      appBarTitle: AppStrings.dashboard,
      isBackButtonNeededInAppBar: false,
      suffixIconAssetPathInAppBar: ImageAssets.logout,
      onSuffixIconPressed: () =>
          // Instead of directly loging out a dialog will pop up
          dashboardViewModel.showLogoutDialog(context),
      onlyListOrGridView: true,
      body: const SizedBox(),
      listOrGridBody: Expanded(
        // Changes crossAxisCount 2 to 1
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: GridView.count(
            crossAxisCount: 1,
            shrinkWrap: true,
            crossAxisSpacing: AppPaddings.p20,
            mainAxisSpacing: AppPaddings.p20,
            childAspectRatio: (itemWidth / itemHeight),
            children: ListConstants.dashboardItems.map((dashboardItem) {
              return _dashboardListItem(dashboardItem);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _dashboardListItem(DashboardItem dashboardItem) {
    return InkWell(
      onTap: () => _goToDashboardItem(dashboardItem),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.appBarDividerColor),
            borderRadius:
                const BorderRadius.all(Radius.circular(AppRadius.r10))),
        padding: const EdgeInsets.all(AppPaddings.p15),
        child: Center(
          // MainAxisAlignment.center to MainAxisAlignment.start
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
              // Add flex
              flex: -1,
              child: Align(
                // Alignment from centerRight to centerLeft
                alignment: Alignment.centerLeft,
                child: Card(
                  elevation: AppSizes.s4,
                  shadowColor: ColorManager.white,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPaddings.p10),
                    child: SvgPicture.asset(
                      dashboardItem.iconPath,
                      width: AppSizes.s36,
                      height: AppSizes.s36,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              // Increase width to 20
              width: AppSizes.s20,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(dashboardItem.name,
                    maxLines: 2, textStyle: getDashboardTextStyle()),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  _goToDashboardItem(DashboardItem dashboardItem) {
    String routeName = '';

    switch (dashboardItem.name) {
      case AppStrings.poReceipt:
        routeName = Routes.warehouseOperationsRoute;
        break;
      case AppStrings.putAway:
        routeName = Routes.putAwayRequestEnquiryRoute;
        break;
      case AppStrings.pickConfirm:
        routeName = Routes.pickConfirmRequestEnquiryRoute;
        break;
      case AppStrings.shipConfirm:
        routeName = Routes.shipConfirmFetch;
        break;
      case AppStrings.splitCombine:
        routeName = Routes.combineSplitRoute;
        break;

      default:
        routeName = Routes.warehouseOperationsRoute;
    }

    if (routeName.isNotEmpty) Get.toNamed(routeName);
  }
}
