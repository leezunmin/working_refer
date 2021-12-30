import 'package:application/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AppTheme { light, dark }

extension AppThemeExtension on AppTheme {
  ThemeMode get mode {
    switch (this) {
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.dark:
      default:
        return ThemeMode.dark;
    }
  }

  ThemeData get spec {
    switch (this) {
      case AppTheme.light:
        return ThemeData(
          brightness: Brightness.light,
          textTheme: appSimpleTextTheme,
          appBarTheme: AppBarTheme(
              elevation: 2,
              color: AppColors.white,
              iconTheme: const IconThemeData(color: AppColors.black),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              toolbarTextStyle: appSimpleTextTheme.bodyText2,
              titleTextStyle: appSimpleTextTheme.headline6),
          tabBarTheme: TabBarTheme(
            indicator: const BoxDecoration(
              color: AppColors.warmGray,
            ),
            labelColor: AppColors.warmGray,
            unselectedLabelColor: AppColors.warmGray,
            labelStyle: appSimpleTextTheme.subtitle1,
            unselectedLabelStyle: appSimpleTextTheme.subtitle1,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: AppColors.transparent),
          scaffoldBackgroundColor: AppColors.white,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: AppColors.transparent),
        );
      case AppTheme.dark:
        return ThemeData(brightness: Brightness.dark);
    }
  }
}
