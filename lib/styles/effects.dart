import 'package:application/styles/styles.dart';
import 'package:flutter/material.dart';

class AppBoxShadows {
  AppBoxShadows._();

  static final dropSm = BoxShadow(
    color: AppColors.black.withAlpha(25),
    blurRadius: 4,
    offset: const Offset(0, 2),
  );

  static const dropMd = BoxShadow(
    color: AppColors.black12,
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  static final dropMd2 = BoxShadow(
    color: AppColors.black.withAlpha(204),
    blurRadius: 4,
    offset: const Offset(0, 2),
  );

  static const dropLg = BoxShadow(
    color: AppColors.black12,
    blurRadius: 30,
    offset: Offset(0, 15),
  );

  static final dropLg2 = BoxShadow(
    color: AppColors.black.withAlpha(204),
    blurRadius: 15,
    offset: const Offset(0, 5),
  );
}
