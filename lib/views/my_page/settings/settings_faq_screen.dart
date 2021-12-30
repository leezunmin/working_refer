import 'package:application/repositories/repository.dart';
import 'package:application/services/services.dart';
import 'package:application/styles/styles.dart';
import 'package:application/views/views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsFaqScreen extends StatefulWidget {
  static const routeName = '/mypage/settings/fap';

  const SettingsFaqScreen({Key? key}) : super(key: key);

  @override
  _SettingsFaqScreenState createState() => _SettingsFaqScreenState();
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });
  String question;
  String answer;
  bool isExpanded;
}

class _SettingsFaqScreenState extends State<SettingsFaqScreen> {
  late final Repository _repo;
  late final AuthStateService _authState;
  late final List<Item> _data = [];

  @override
  void initState() {
    super.initState();
    _repo = context.read<Repository>();
    _authState = context.read<AuthStateService>();

    fetchFaqList();
  }

  Future fetchFaqList() async {
    Stream<List> result = _repo.faqs();

    result.listen((event) {
      for (var element in event) {
        setState(() {
          // Item each = Item(question: element!.question, answer: element.answer);
          Item each = Item(
              question: element!.question,
              answer: element.answer,
              isExpanded: false);
          _data.add(each);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
        appBar: appPageAppBar(context, title: '자주 하는 질문', showAcions: false),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacers.height16,

                // 원
                ExpansionPanelList(
                    expandedHeaderPadding: AppEdgeInsets.zero,
                    elevation: 0,
                    dividerColor: Colors.white,
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _data[index].isExpanded = !isExpanded;
                      });
                    },
                    children: _data.map<ExpansionPanel>((Item item) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(title: Text(item.question));
                        },
                        body: Container(
                          width: double.maxFinite,
                          padding: AppEdgeInsets.all16,
                          margin: AppEdgeInsets.all16,
                          decoration: BoxDecoration(
                            borderRadius: AppBorderRadius.circular16,
                            color: AppColors.gray[20],
                          ),
                          child: Text(item.answer,
                              style: theme.textTheme.bodyText2!
                                  .apply(color: AppColors.text50)),
                        ),
                        isExpanded: item.isExpanded,
                      );
                    }).toList())
              ],
            ));
          },
        ));
  }
}
