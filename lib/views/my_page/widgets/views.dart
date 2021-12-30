import 'package:application/generated/assets.gen.dart';
import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/services/services.dart';
import 'package:application/styles/styles.dart';
import 'package:application/views/views.dart';
import 'package:flutter/material.dart';

export 'community_card.dart';
export 'like_profile_card.dart';
export 'meet_member_card.dart';
export 'meet_team_or_member_list.dart';
export 'meeting_card.dart';
export 'setting_tabable_item.dart';
export 'setting_toggle_switch.dart';
export 'settings_sub_body_text.dart';
export 'starpoint_history.dart';
export 'starpoint_order.dart';
export 'starpoint_question.dart';
export 'title_divider.dart';

PreferredSizeWidget appPageAppBar(BuildContext context,
    {String title = '',
    bool showAcions = true,
    bool showLeading = true,
    VoidCallback? onLeadingAction,
    ValueChanged? onAction,
    Widget? icon1,
    Widget? icon2}) {
  ThemeData theme = Theme.of(context);

  return AppBar(
    centerTitle: true,
    elevation: 1,
    leading: showLeading
        ? IconButton(
            icon:
                ImageIcon(Assets.images.icArrowLeft24, color: AppColors.text60),
            onPressed: onLeadingAction ??
                () {
                  Navigator.of(context).pop();
                })
        : Container(),
    title: Text(
      title,
      style: theme.textTheme.headline6!.apply(color: AppColors.text60),
    ),
    actions: showAcions
        ? [
            IconButton(
                icon: icon1 ?? const Icon(Icons.bluetooth_outlined),
                onPressed: () {
                  onAction!(0);
                }),
            AppSpacers.width8,
            IconButton(
                icon: icon2 ?? const Icon(Icons.face),
                onPressed: () {
                  onAction!(1);
                }),
            AppSpacers.width8
          ]
        : [],
  );
}

PreferredSizeWidget myPageAppBarWithTapBar(BuildContext context, List<Tab> tabs,
    {String title = '',
    bool showAcions = true,
    bool showLeading = true,
    Widget? icon1,
    Widget? icon2,
    TabController? controller,
    ValueChanged<int>? onAction,
    ValueChanged<int>? onTap}) {
  ThemeData theme = Theme.of(context);

  return AppBar(
    centerTitle: true,
    leading: showLeading
        ? IconButton(
            icon:
                ImageIcon(Assets.images.icArrowLeft24, color: AppColors.text60),
            onPressed: () {
              Navigator.of(context).pop();
            })
        : Container(),
    title: Text(
      title,
      style: theme.textTheme.headline6!.apply(color: AppColors.text60),
    ),
    actions: showAcions
        ? [
            IconButton(
                icon: icon1 ??
                    Icon(Icons.bluetooth_outlined, color: AppColors.text60),
                onPressed: () {
                  onAction!(0);
                }),
            AppSpacers.width8,
            IconButton(
                icon: icon2 ?? Icon(Icons.face, color: AppColors.text60),
                onPressed: () {
                  onAction!(1);
                }),
            AppSpacers.width8
          ]
        : [],
    bottom: TabBar(
      onTap: (index) {
        if (onTap != null) onTap(index);
      },
      controller: controller,
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.warmGray,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 3, color: AppColors.primary)),
      ),
      tabs: tabs,
    ),
  );
}
