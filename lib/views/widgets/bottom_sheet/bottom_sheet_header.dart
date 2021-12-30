import 'package:application/styles/colors.dart';
import 'package:application/styles/tokens.dart';
import 'package:flutter/material.dart';

class BottomSheetHeader extends StatelessWidget {
  final String? title;
  final Widget? tail;
  final String? subTitle;
  const BottomSheetHeader(this.title, {this.subTitle, this.tail, Key? key})
      : super(key: key);

  bool get hasSubTitle => subTitle != null;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Widget _tail = tail == null ? Container() : tail!;
    bool hasTail = tail != null;
    var body = SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: AppTokens.k4,
              width: AppTokens.k40,
              margin: AppEdgeInsets.vertical16,
              decoration: BoxDecoration(
                  color: AppColors.text40,
                  borderRadius: AppBorderRadius.circular4),
            ),
          ),
          AppSpacers.height8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                      padding: AppEdgeInsets.horizontal16,
                      child: Text(
                        title!,
                        style: theme.textTheme.subtitle1!
                            .apply(color: AppColors.text60),
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 150,
                      child: Padding(
                        padding: AppEdgeInsets.horizontal16,
                        child: _tail,
                      )),
                ],
              )
            ],
          ),
          if (hasSubTitle) AppSpacers.height8,
          if (hasSubTitle)
            Padding(
                padding: AppEdgeInsets.horizontal16,
                child: Text(
                  subTitle!,
                  style:
                      theme.textTheme.caption!.apply(color: AppColors.text50),
                )),
          AppSpacers.height16,
          const Divider(
            thickness: 2,
            height: 2,
          ),
          AppSpacers.height8,
        ],
      ),
    );

    return body;
  }
}
