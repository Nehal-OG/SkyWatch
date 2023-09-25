// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:SkyWatch/presentation/resources/color_manager.dart';
import 'package:SkyWatch/presentation/resources/styles_manager.dart';
import 'package:SkyWatch/presentation/resources/values_manager.dart';
import 'package:SkyWatch/presentation/widgets/custom_divider.dart';

Widget CustomListView({
  required Widget Function(int) listItemWidget,
  Widget Function(int)? seperatorBuilderWidget,
  required int listItemCount,
  bool isBackgroundColorNeeded = true,
  showCustomDivider = true,
}) {
  Widget commonListView() {
    return ListView.separated(
      itemCount: listItemCount,
      //physics: const NeverScrollableScrollPhysics(),
      //shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        if (seperatorBuilderWidget != null) {
          return seperatorBuilderWidget(index);
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: AppPaddings.p8),
          child: showCustomDivider ? CustomDivider() : const SizedBox(),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return listItemWidget(index);
      },
    );
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: isBackgroundColorNeeded
        ? Card(
            elevation: AppSizes.sZero,
            color: ColorManager.greyListBackgroundColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.r10))),
            child: Padding(
              padding: const EdgeInsets.all(AppPaddings.p14),
              child: commonListView(),
            ),
          )
        : commonListView(),
  );
}

/// Sample

// /// GET LPN SHIP CONFIRM LIST ITEM
// InkWell ShipConfirmGetLPNListItem(
//   GetLPNShipConfirmRecord getLPNShipConfirmRecord, {
//   required VoidCallback onPressed,
//   bool isSelected = false,
// }) {
//   return InkWell(
//     onTap: onPressed,
//     child: Card(
//       elevation: AppSizes.sZero,
//       color: ColorManager.greyListBackgroundColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10)),
//         side: isSelected
//             ? const BorderSide(color: ColorManager.appBarDividerColor)
//             : BorderSide.none,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(AppPaddings.p12),
//         child: Row(
//           children: [
//             Expanded(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _addLabelValueText(
//                       labelText: '',
//                       valueText:
//                           getLPNShipConfirmRecord.fromLicensePlateNumber!,
//                     ),
//                     _addLabelValueText(
//                       labelText: '',
//                       valueText: getLPNShipConfirmRecord.lotNumber!,
//                     )
//                   ]),
//             ),
//             Container(
//               color: Colors.grey[600],
//               width: AppSizes.s1,
//               height: 40.0,
//             ),
//             const SizedBox(width: AppSizes.s18),
//             _addLabelValueText(
//               labelText: '',
//               valueText:
//                   getLPNShipConfirmRecord.totalQuantity!.toStringAsFixed(2),
//               fontsize: 15.0,
//               bottomPadding: 0.0,
//             ),
//             const SizedBox(width: AppSizes.s14),
//             Visibility(
//               visible: isSelected,
//               child: Icon(
//                 Icons.check_circle,
//                 size: 15.0,
//                 color: Colors.grey[800],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

/// SHIP CONFIRM LIST ITEM
// InkWell ShipConfirmFetchListItem(ShipConfirmFetchRecord shipConfirmFetchRecord,
//     {required VoidCallback onPressed}) {
//   return InkWell(
//     onTap: onPressed,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         _addLabelValueText(
//           labelText: AppStrings.orderNoColon,
//           valueText: shipConfirmFetchRecord.orderNumber.toString(),
//         ),
//         Row(
//           children: [
//             Expanded(
//                 child: _addLabelValueText(
//                     labelText: '',
//                     valueText:
//                         '${shipConfirmFetchRecord.orderNumber} / ${shipConfirmFetchRecord.orderType} / ${shipConfirmFetchRecord.orderCompany}')),
//             _addLabelValueText(
//               labelText: AppStrings.lineNumberColon,
//               valueText: shipConfirmFetchRecord.lineNumber.toString(),
//             )
//           ],
//         ),
//         Row(
//           children: [
//             Expanded(
//                 child: _addLabelValueText(
//                     labelText: '',
//                     valueText:
//                         '${shipConfirmFetchRecord.soldToNumber} / ${shipConfirmFetchRecord.shipToNumber}')),
//             Visibility(
//               visible: true,
//               child: _addLabelValueText(
//                 labelText: AppStrings.qtyColon,
//                 valueText: shipConfirmFetchRecord.quantityShipped.toString(),
//               ),
//             ),
//           ],
//         ),
//         _addLabelValueText(
//           labelText: '',
//           valueText:
//               "${shipConfirmFetchRecord.itemNumber.toString()} / ${shipConfirmFetchRecord.itemDescription}",
//         ),
//       ],
//     ),
//   );
// }

Widget _addSingleRow({
  required String labelOneText,
  required String valueOneText,
  bool showDivider = false,
}) {
  return Row(
    children: [
      Expanded(
        child: _addLabelValueText(
            labelText: labelOneText, valueText: valueOneText),
      ),
      if (showDivider)
        Container(
          width: AppSizes.s1,
          color: ColorManager.listDividerColor,
        ),
    ],
  );
}

Widget _addRow({
  required String labelOneText,
  required String valueOneText,
  required String labelTwoText,
  required String valueTwoText,
  bool showDivider = false,
}) {
  return Row(
    children: [
      Expanded(
        child: _addLabelValueText(
            labelText: labelOneText, valueText: valueOneText),
      ),
      if (showDivider)
        Container(
          width: AppSizes.s1,
          color: ColorManager.listDividerColor,
        ),
      Expanded(
        child: _addLabelValueText(
            labelText: labelTwoText, valueText: valueTwoText),
      )
    ],
  );
}

Widget _addThreeRow({
  required String labelOneText,
  required String valueOneText,
  required String labelTwoText,
  required String valueTwoText,
  required bool showVariance,
  required bool variance,
  double? fontsizeOne,
  double? fontsizeTwo,
  bool showDivider = false,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _addLabelValueText(
        labelText: labelOneText,
        valueText: valueOneText,
        fontsize: fontsizeOne,
      ),
      if (showDivider)
        Container(
          width: AppSizes.s1,
          color: ColorManager.listDividerColor,
        ),
      _addLabelValueText(
        labelText: labelTwoText,
        valueText: valueTwoText,
        fontsize: fontsizeTwo,
      ),
      showVariance
          ? SizedBox(
              height: 10,
              width: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: variance ? Colors.green : Colors.red,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            )
          : const SizedBox()
      // SizedBox(
      //   height: 10,
      //   width: 10,
      //   child: Container(
      //     decoration: BoxDecoration(
      //         color: Colors.red,
      //         borderRadius: BorderRadius.all(Radius.circular(10))),
      //   ),
      // )
    ],
  );
}

Padding _addLabelValueText(
    {required String labelText,
    required String valueText,
    double? fontsize,
    double? bottomPadding}) {
  return Padding(
    padding: EdgeInsets.only(bottom: bottomPadding ?? AppPaddings.p8),
    child: AutoSizeText.rich(TextSpan(
        style: getListItemTextStyle(isLabel: true),
        children: <TextSpan>[
          TextSpan(
            text: labelText,
          ),
          TextSpan(
              text: valueText,
              style: getListItemTextStyle(isLabel: false, fontsize: fontsize)),
        ])),
  );
}
