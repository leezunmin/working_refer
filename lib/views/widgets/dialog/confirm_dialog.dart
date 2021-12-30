import 'package:application/styles/styles.dart';
import 'package:application/views/widgets/dialog/app_dialog.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final Widget? left;
  final Widget? right;
  final VoidCallback? onPressedLeft;
  final VoidCallback? onPressedRight;
  final bool isLeftDisabled;
  final bool isRightDisabled;
  final bool isAutoPop;

  const ConfirmDialog(
      {this.title,
      this.content,
      this.left,
      this.right,
      this.onPressedLeft,
      this.onPressedRight,
      this.isLeftDisabled = false,
      this.isRightDisabled = false,
      this.isAutoPop = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return AppDialog(
        title: title ?? Container(),
        content: Padding(padding: AppEdgeInsets.horizontal24, child: content),
        actions: [
          TextButton(
            child: DefaultTextStyle(
                style: theme.textTheme.button!.apply(color: AppColors.text50),
                child: left ?? const Text('취소')),
            onPressed: isLeftDisabled
                ? null
                : () {
                    if (onPressedLeft == null) {
                      Navigator.of(context).pop();
                    } else {
                      onPressedLeft!();
                    }
                  },
          ),
          TextButton(
            child: DefaultTextStyle(
                style: theme.textTheme.button!.apply(color: AppColors.primary),
                child: right ?? const Text('확인')),
            onPressed: isRightDisabled
                ? null
                : () {
                    if (onPressedRight != null) onPressedRight!();
                    if (isAutoPop) Navigator.of(context).pop();
                  },
          ),
        ]);
  }
}
