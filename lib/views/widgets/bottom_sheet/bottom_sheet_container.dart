// import 'package:application/styles/styles.dart';
// import 'package:flutter/material.dart';

// class BottomSheetContainer extends StatelessWidget {
//   final List<Widget> items;

//   const BottomSheetContainer(this.items, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);

//     return Wrap(
//       children: [
//         Container(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           decoration: const BoxDecoration(
//             color: AppColors.white,
//             borderRadius: AppBorderRadius.verticalTop24,
//           ),
//           child: SafeArea(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ...items,
//             ],
//           )),
//         ),
//       ],
//     );
//   }
// }

// class DraggableBottomSheetContainer extends StatelessWidget {
//   final List<Widget> items;

//   /// The initial fractional value of the parent container's height to use when
//   /// displaying the widget.
//   ///
//   /// The default value is `0.5`.
//   final double initialChildSize;

//   /// The minimum fractional value of the parent container's height to use when
//   /// displaying the widget.
//   ///
//   /// The default value is `0.25`.
//   final double minChildSize;

//   /// The maximum fractional value of the parent container's height to use when
//   /// displaying the widget.
//   ///
//   /// The default value is `1.0`.
//   final double maxChildSize;

//   /// Whether the widget should expand to fill the available space in its parent
//   /// or not.
//   ///
//   /// In most cases, this should be true. However, in the case of a parent
//   /// widget that will position this one based on its desired size (such as a
//   /// [Center]), this should be set to false.
//   ///
//   /// The default value is true.
//   final bool expand;

//   const DraggableBottomSheetContainer(this.items,
//       {this.initialChildSize = 0.5,
//       this.minChildSize = 0.25,
//       this.maxChildSize = 1.0,
//       this.expand = true,
//       Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);

//     return DraggableScrollableSheet(
//         initialChildSize: initialChildSize,
//         minChildSize: minChildSize,
//         maxChildSize: maxChildSize,
//         expand: expand,
//         builder: (context, controller) {
//           return Container(
//             decoration: const BoxDecoration(
//               color: AppColors.white,
//               borderRadius: AppBorderRadius.verticalTop24,
//             ),
//             child: SafeArea(
//                 child: ListView(
//               controller: controller,
//               children: [
//                 ...items,
//               ],
//             )),
//           );
//         });
//   }
// }
