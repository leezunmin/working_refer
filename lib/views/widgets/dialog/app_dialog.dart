import 'package:application/styles/styles.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final Widget? title;
  final Widget content;
  final List<Widget>? actions;

  const AppDialog({required this.content, this.title, this.actions, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.circular8,
      ),
      contentPadding: AppEdgeInsets.zero,
      titleTextStyle: theme.textTheme.headline6!.apply(color: AppColors.text60),
      title: title,
      titlePadding: AppEdgeInsets.all24,
      content: SingleChildScrollView(
        child: DefaultTextStyle(
            style: theme.textTheme.bodyText2!.apply(color: AppColors.text50),
            child: content),
      ),
      actions: actions,
    );
  }
}
