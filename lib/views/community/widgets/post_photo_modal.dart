import 'package:application/repositories/repository.dart';
import 'package:application/styles/styles.dart';
import 'package:flutter/material.dart';

class PhotoOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  final String imagePath;
  final Repository repo;
  final ImageInfo? imageInfo;
  final ImageProvider? imageProvider;
  PhotoOverlay(this.imagePath, this.repo, {this.imageInfo, this.imageProvider});

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: Container(
        color: AppColors.black.withOpacity(0.4),
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    String meta = imagePath;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SafeArea(
            child: Padding(
          padding: AppEdgeInsets.right8,
          child: IconButton(
              color: AppColors.white,
              icon: const Icon(Icons.close_outlined),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        )),
        if (meta.isEmpty)
          Center(
              child: Container(
            width: MediaQuery.of(context).size.width - 32,
            height: (MediaQuery.of(context).size.width - 32),
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: ExactAssetImage(
                    'assets/images/ic_empty.png',
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(width: 1, color: AppColors.white),
                borderRadius: AppBorderRadius.circular16),
          )),
        if (imageInfo != null && imageProvider != null)
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 32,
              height: (MediaQuery.of(context).size.width - 32) *
                          (imageInfo!.image.height / imageInfo!.image.width) >
                      (MediaQuery.of(context).size.height - 130)
                  ? (MediaQuery.of(context).size.height - 130)
                  : (MediaQuery.of(context).size.width - 32) *
                      (imageInfo!.image.height / imageInfo!.image.width),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.white),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider!,
                  ),
                  color: AppColors.text40,
                  borderRadius: AppBorderRadius.circular16),
            ),
          ),
        if (imageInfo == null && meta.isNotEmpty)
          Center(
              child: Container(
            decoration: const BoxDecoration(
                // color: AppColors.white,
                // image: DecorationImage(
                //   image: ExactAssetImage(
                //     'assets/images/ic_refesh.png',
                //   ),
                //   fit: BoxFit.cover,
                // ),
                ),
            child: FutureBuilder<String>(
              future: repo.downloadUrl(meta),
              builder: (context, fsnapshot) {
                ImageProvider ip = const ExactAssetImage(
                  'assets/images/ic_empty.png',
                );
                if (fsnapshot.hasData) {
                  return Container(
                    width: MediaQuery.of(context).size.width - 32,
                    height: (MediaQuery.of(context).size.width - 32),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.white),
                        image: DecorationImage(
                          fit: fsnapshot.hasData ? BoxFit.cover : BoxFit.none,
                          image: ip,
                        ),
                        color: AppColors.text40,
                        borderRadius: AppBorderRadius.circular16),
                  );
                } else {
                  return Container();
                }
              },
            ),
          )),
        Container(
          height: (MediaQuery.of(context).size.width / 8),
        )
      ],
    );
  }
}
