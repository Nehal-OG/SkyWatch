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

import '../../resources/strings_manager.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/custom_text.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenViewModel = Get.find<HomeScreenViewModel>();

    return CustomScaffold(context,
        scaffoldPadding: AppPaddings.p0,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                  ImageAssets.homeBackground,
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            constraints: const BoxConstraints.expand(),
            child: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () async {
                        // var weatherData = await weather.getweatherData();
                        // updateUI(weatherData);
                      },
                      child: const Icon(
                        Icons.near_me,
                        size: 45.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.toNamed(Routes.settingsRoute),
                      icon: const Icon(
                        Icons.settings,
                        color: ColorManager.white,
                      ),
                    ),
                    // MaterialButton(
                    //   onPressed: () async {
                    //     // String typecity = await Navigator.push(
                    //     //   context,
                    //     //   MaterialPageRoute(
                    //     //     builder: (context) {
                    //     //       return const CityScreen();
                    //         },
                    //       ),
                    //     );
                    // print(typecity);
                    // if (typecity.isNotEmpty) {
                    //   var weatherData =
                    //       await weather.getCityWeather(typecity);
                    //   print(weatherData);
                    //   updateUI(weatherData);
                    // }
                    // },

                    // child: const Icon(
                    //   Icons.location_city,
                    //   size: 45.0,
                    // ),
                    // ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    // '$getMessage in $cityname',
                    "Hello",
                    textAlign: TextAlign.right,
                    // style: kMessageTextStyle,
                  ),
                ),
              ],
            ))));
  }
}
