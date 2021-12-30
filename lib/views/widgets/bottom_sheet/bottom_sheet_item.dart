import 'package:application/styles/colors.dart';
import 'package:application/styles/tokens.dart';
import 'package:flutter/material.dart';

class BottomSheetItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Widget? tailIcon;
  final EdgeInsets titlePadding;
  final double height;
  const BottomSheetItem(this.title, this.onTap,
      {this.tailIcon,
      this.titlePadding = AppEdgeInsets.left16,
      this.height = AppTokens.k48,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Container(
                  // width: MediaQuery.of(context).size.width,
                  height: height,
                  padding: titlePadding,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: theme.textTheme.subtitle2!
                          .apply(color: AppColors.text50),
                    ),
                  ))),
          Container(margin: AppEdgeInsets.right16, child: tailIcon)
        ],
      ),
    );
  }
}
