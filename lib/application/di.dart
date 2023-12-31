import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_watch/data/data_source/remote_data_source.dart';
import 'package:sky_watch/data/network/app_api.dart';
import 'package:sky_watch/data/network/dio_factory.dart';
import 'package:sky_watch/data/repository_impl/repository_impl.dart';
import 'package:sky_watch/domain/repository/repository.dart';
import 'package:sky_watch/domain/usecases/logout_usecase.dart';
import 'package:sky_watch/presentation/pages/home_screen/home_screen_view_model.dart';
import 'package:sky_watch/presentation/pages/settings/settings_view_model.dart';
import 'package:sky_watch/presentation/pages/splash/splash_view_model.dart';
import 'package:sky_watch/presentation/resources/color_manager.dart';
import 'package:sky_watch/presentation/resources/values_manager.dart';
import '../data/network/network_info.dart';
import '../domain/usecases/login_usecase.dart';
import 'app_prefs.dart';

Future<void> initAppModule() async {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = AppSizes.s45
    ..radius = AppRadius.r10
    ..progressColor = ColorManager.primary
    ..backgroundColor = ColorManager.white
    ..indicatorColor = ColorManager.primary
    ..textColor = ColorManager.primary
    //..maskColor = CoColor.fromARGB(255, 20, 28, 33)city(0.3)
    ..userInteractions = true
    ..dismissOnTap = false
    ..maskType = EasyLoadingMaskType.black
    ..toastPosition = EasyLoadingToastPosition.bottom;

  final sharedPreferences = await SharedPreferences.getInstance();

  // Shared Preferences
  Get.lazyPut<SharedPreferences>(() => sharedPreferences, fenix: true);

  // App Preferences
  // = () => AppPreferences(instance()));
  Get.lazyPut<AppPreferences>(
      () => AppPreferences(Get.find<SharedPreferences>()),
      fenix: true);

  // Network Info
  Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()),
      fenix: true);

  // Dio Factory
  Get.lazyPut<DioFactory>(() => DioFactory(Get.find<AppPreferences>()),
      fenix: true);

  Dio dio = await Get.find<DioFactory>().getDio();

  // App Service Client
  Get.lazyPut<AppServiceClient>(() => AppServiceClient(dio), fenix: true);

  // Remote Data Source
  Get.lazyPut<RemoteDataSource>(
      () => RemoteDataSourceImpl(Get.find<AppServiceClient>()),
      fenix: true);

  // Repository
  Get.lazyPut<Repository>(
      () => RepositoryImpl(
            Get.find<NetworkInfo>(),
            Get.find<RemoteDataSource>(),
          ),
      fenix: true);
}

initSplashModule() {
  if (!Get.isRegistered<SplashViewModel>()) {
    // Splash View Model
    Get.put(SplashViewModel());
  }
}

initLoginModule() {
  if (!Get.isRegistered<LoginUseCase>()) {
    // Login UseCase
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find<Repository>()));

    // Login View Model
    Get.lazyPut<HomeScreenViewModel>(
        () => HomeScreenViewModel(Get.find<LoginUseCase>()));
  }
}

// SETTINGS
initSettingsModule() {
  if (!Get.isRegistered<SettingsViewModel>()) {
    // Replenishment MainView Model
    Get.lazyPut<SettingsViewModel>(() => SettingsViewModel());
  }
}
