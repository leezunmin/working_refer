import 'package:application/styles/styles.dart';
import 'package:flutter/material.dart';

class AppAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget? leadingIcon;
  final Widget? flexibleSpace;
  final Function? leadingIconOnPressed;
  final Widget? actionIcon;
  final List<Widget>? actions;
  final Function? actionIconOnPressed;
  final double elevation;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle;
  final Color? backgroundColor;

  @override
  final Size preferredSize;
  const AppAppBar(
    this.title, {
    Key? key,
    this.backgroundColor = AppColors.transparent,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
    this.flexibleSpace,
    this.leadingIcon,
    this.actionIcon,
    this.actions,
    this.centerTitle,
    this.elevation = 0,
    this.leadingIconOnPressed,
    this.actionIconOnPressed,
    this.bottom,
  }) : super(key: key);

  @override
  _AppAppBarState createState() => _AppAppBarState();
}

class _AppAppBarState extends State<AppAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: widget.flexibleSpace,
      automaticallyImplyLeading: false,
      centerTitle: widget.centerTitle ?? true,
      elevation: widget.elevation,
      backgroundColor: widget.backgroundColor,
      leading: widget.leadingIcon != null
          ? IconButton(
              icon: widget.leadingIcon!,
              color: AppColors.text60,
              iconSize: AppTypoTokens.k20,
              onPressed: widget.leadingIconOnPressed as void Function()?,
            )
          : null,
      titleSpacing: widget.leadingIcon != null ? 0 : AppTokens.k16,
      title: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline6!,
        child: widget.title,
      ),
      actions: widget.actions ??
          <Widget>[
            if (widget.actionIcon != null)
              IconButton(
                icon: widget.actionIcon!,
                onPressed: widget.actionIconOnPressed as void Function()?,
                color: AppColors.text60,
                iconSize: AppTypoTokens.k20,
              ),
          ],
      bottom: widget.bottom,
    );
  }
}
