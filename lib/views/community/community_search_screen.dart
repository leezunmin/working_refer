import 'package:application/generated/assets.gen.dart';
import 'package:application/repositories/repository.dart';
import 'package:application/services/services.dart';
import 'package:application/styles/styles.dart';
import 'package:application/views/views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 사용안함
// 사용안함
// 사용안함
// 사용안함

class CommunitySearchScreen extends StatefulWidget {
  static const routeName = '/community/search';

  const CommunitySearchScreen({Key? key}) : super(key: key);
  @override
  _CommunitySearchScreenState createState() => _CommunitySearchScreenState();
}

class _CommunitySearchScreenState extends State<CommunitySearchScreen> {
  final TextEditingController editingController = TextEditingController();

  late final Repository _repo;
  late final NavigatorState _rootNavi;

  String? selectedSchool;
  List<String> schools = [];

  @override
  void initState() {
    super.initState();
    _repo = context.read<Repository>();
    _rootNavi = context.read<NavigationService>().rootKey.currentState!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: appPageAppBar(context, title: '검색', onLeadingAction: () {
          // _rootNavi.pop();
          var navi = Navigator.of(context);
          navi.pop();
        }, showAcions: false),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
            return SafeArea(
                child: Column(
              children: [
                AppSpacers.height24,
                Container(
                  padding: AppEdgeInsets.horizontal16,
                  child: RRectOutlineTextField(
                    controller: editingController,
                    leadingIcon: Row(
                      children: [
                        AppSpacers.width8,
                        ImageIcon(Assets.images.icSearch,
                            color: AppColors.text60),
                        AppSpacers.width16
                      ],
                    ),
                    hintText: '제목 또는 내용 입력',
                    editable: true,
                    onSubmitted: (text) {
                      var v = editingController.text;
                    },
                    onTap: () {},
                  ),
                ),
                AppSpacers.height24,
                Divider(
                  height: 0,
                  thickness: 4,
                  color: AppColors.border,
                ),
                AppSpacers.height16,
                Expanded(
                    child: Container(
                  padding: AppEdgeInsets.horizontal16,
                  child: ListView.builder(
                      itemCount: 0,
                      itemBuilder: (context, index) {
                        return Container();
                      }),
                ))
              ],
            ));
          },
        ));
  }
}
