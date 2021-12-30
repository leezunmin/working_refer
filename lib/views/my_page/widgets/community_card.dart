import 'package:application/generated/assets.gen.dart';
import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/styles/styles.dart';
import 'package:application/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommunityCard extends StatelessWidget {
  final AppPost? data;
  Repository? _repo;

  CommunityCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    TextStyle titleStyle =
        theme.textTheme.subtitle1!.apply(color: AppColors.text60);
    TextStyle contentStyle =
        theme.textTheme.caption!.apply(color: AppColors.text40);
    TextStyle infoStyle = theme.textTheme.caption!.apply(
      color: AppColors.text50,
    );

    return Container(
      margin: AppEdgeInsets.vertical8.add(AppEdgeInsets.horizontal16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data!.title!,
                          style: titleStyle,
                          overflow: TextOverflow.clip,
                        ),
                        AppSpacers.height8,
                        SizedBox(
                          height: 32,
                          child: Text(
                            data!.text,
                            style: contentStyle,
                            // minFontSize: 13,
                            maxLines: 2,
                          ),
                        )
                      ]),
                ],
              )),
              AppSpacers.width4,
              data!.voteUid != null
                  ? Text('[투표]',
                      style: AppTypos.noto_light.apply(
                          fontSizeDelta: -2.0, color: AppColors.primaryDark))
                  : const SizedBox(),
              AppSpacers.width16,
              data!.imgDownload == ""
                  ? AppSpacers.height64
                  : Container(
                      /*width: MediaQuery.of(context).size.width - 32,
                height: (MediaQuery.of(context).size.width - 32),*/
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                CachedNetworkImageProvider(data!.imgDownload!),
                          ),
                          // border: Border.all(width: 1, color: AppColors.primary),
                          borderRadius: AppBorderRadius.circular8),
                    ),
            ],
          ),
          AppSpacers.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 80,
                  child: Text(
                    data!.nickName,
                    overflow: TextOverflow.ellipsis,
                    style: infoStyle,
                  )),
              /*Text(
                  data!.nickName,
                  style: infoStyle,
                ),*/
              AppSpacers.width16,
              Expanded(
                flex: 5,
                child: Text(
                  formatyyMMddHHmm(data!.createdAt!),
                  overflow: TextOverflow.ellipsis,
                  style: infoStyle,
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ImageIcon(
                        Assets.images.icHeart18,
                        size: 15,
                      ),
                      AppSpacers.width8,
                      Text(
                        data!.likeCount.toString(),
                        style: infoStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      AppSpacers.width8,
                      AppSpacers.width8,
                      ImageIcon(
                        Assets.images.icReply18,
                        size: 15,
                      ),
                      AppSpacers.width8,
                      Text(
                        data!.replyCount.toString(),
                        style: infoStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
