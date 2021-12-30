import 'package:application/styles/colors.dart';
import 'package:application/styles/tokens.dart';
import 'package:application/views/widgets/portrait/portrait.dart';
import 'package:flutter/material.dart';

enum CustomPortraitSize {
  micro,
  mini,
  small,
  msmall,
  medium,
  large,
  xLarge,
}

extension CustomPortraitSizeExtension on PortraitSize {
  Map<String, double> get spec {
    switch (this) {
      case PortraitSize.micro:
        return {
          'radius': AppTokens.k16,
        };
      case PortraitSize.mini:
        return {
          'radius': AppTokens.k24,
        };
      case PortraitSize.small:
        return {
          'radius': AppTokens.k32,
        };
      case PortraitSize.msmall:
        return {
          'radius': AppTokens.k48,
        };
      case PortraitSize.medium:
        return {
          'radius': AppTokens.k64,
        };
      case PortraitSize.large:
        return {
          'radius': AppTokens.k64,
        };
      case PortraitSize.xLarge:
        return {
          'radius': AppTokens.k72,
        };
    }
  }
}

class CustomPortrait extends StatelessWidget {
  // static const String thumbnailSirfix = '?fit=clip&w=200&h=200';
  final PortraitSize size;
  final String imgPath;
  final VoidCallback? onTap;
  final double? radius;
  final bool hasShadow;

  const CustomPortrait(this.imgPath,
      {this.size = PortraitSize.mini,
      this.hasShadow = false,
      this.radius,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        if (hasShadow)
          BoxShadow(
              color: AppColors.gray[40]!,
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(2, 3))
      ]),
      child: CircleAvatar(
        // radius: radius ?? _sizeSpec[size]!['radius'],
        radius: 12,
        backgroundColor: AppColors.transparent,
        // backgroundImage: AssetImage("assets/images/outed_person.png"),
        backgroundImage: AssetImage(imgPath),
        child: const Material(
          shape: CircleBorder(),
          color: AppColors.transparent,
          clipBehavior: Clip.hardEdge,
          /*child: InkWell(
            onTap: onTap,
          ),*/
        ),
      ),
    );
  }
}
