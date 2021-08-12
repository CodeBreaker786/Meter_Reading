import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:metr_reading/utils/const.dart';

void showLoaging({String message}) {
  EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.cubeGrid;
  EasyLoading.instance
    ..backgroundColor = lightGreen
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..radius = 12
    ..displayDuration = const Duration(seconds: 3)
    ..maskColor = lightGreen.withOpacity(.2);
  EasyLoading.show(
      status: message ?? 'Loading...', maskType: EasyLoadingMaskType.custom);
}

void showSuccess({String message}) {
  EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.cubeGrid;
  EasyLoading.instance
    ..backgroundColor = lightGreen.withOpacity(.7)
    ..indicatorColor = Colors.white
    ..radius = 12
    ..textColor = Colors.white
    ..maskColor = lightGreen.withOpacity(.4);
  EasyLoading.showSuccess(message, maskType: EasyLoadingMaskType.custom);
}

void showError({@required String error}) {
  EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
  EasyLoading.instance
    ..backgroundColor = Colors.red.withOpacity(.9)
    ..indicatorColor = Colors.white
    ..radius = 12
    ..textColor = Colors.white
    ..maskColor = lightGreen.withOpacity(.3);

  EasyLoading.showError(
    error.toString(),
    maskType: EasyLoadingMaskType.custom,
  );
}
