import 'package:application/styles/styles.dart';
import 'package:application/views/views.dart';
import 'package:flutter/material.dart';

enum _DateFilter {
  age,
  tomorrow,
  week,
  none,
}

class CustomItemsBottomSheet extends StatefulWidget {
  final String? title;
  final List<BottomSheetItem> items;
  final double height;

  const CustomItemsBottomSheet(this.title, this.items,
      {this.height = 400.0, Key? key})
      : super(key: key);
  @override
  _CustomItemsBottomSheetState createState() => _CustomItemsBottomSheetState();
}

class _CustomItemsBottomSheetState extends State<CustomItemsBottomSheet> {
  int selected = -1;
  _DateFilter currentDateFilter = _DateFilter.none;
  List<_DateFilter> dateFilters = [
    _DateFilter.age,
    _DateFilter.tomorrow,
    _DateFilter.week
  ];
  final RangeValues _currentAgeRangeValues = const RangeValues(10, 30);
  bool ageRangeSetted = false;
  var mens = List<int>.generate(20, (i) => i + 1).skip(1).toList();
  int currentMens = 4;
  bool mensSetted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    TextStyle? pickerItemStyle = theme.textTheme.bodyText1;
    TextStyle? tailTextStyle = theme.textTheme.bodyText2;
    return Container(
      height: widget.height,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.verticalTop24,
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                BottomSheetHeader(widget.title),
                ...widget.items,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
