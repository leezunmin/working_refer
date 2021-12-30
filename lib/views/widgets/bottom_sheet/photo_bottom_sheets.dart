// import 'dart:io';

// import 'package:application/services/services.dart';
// import 'package:application/styles/styles.dart';
// import 'package:application/views/views.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import 'bottom_sheet_container.dart';

// class PhotoSelectorBottomSheet extends StatefulWidget {
//   final ValueChanged<File?>? onPick;
//   final VoidCallback? onPhotoPicker;

//   const PhotoSelectorBottomSheet({this.onPick, this.onPhotoPicker, Key? key})
//       : super(key: key);
//   @override
//   _PhotoSelectorBottomSheetState createState() =>
//       _PhotoSelectorBottomSheetState();
// }

// class _PhotoSelectorBottomSheetState extends State<PhotoSelectorBottomSheet>
//     with ImagePermissionMixin {
//   final picker = ImagePicker();
//   File? _image;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     VoidCallback _onPicker = widget.onPhotoPicker ?? () {};

//     return BottomSheetContainer(
//       [
//         const BottomSheetHeader("사진 추가하기"),
//         BottomSheetItem("카메라 촬영", () async {
//           _onPicker();
//           await getImagePermission(imageSource: ImageSource.camera);
//           Navigator.of(context).pop();
//         }),
//         BottomSheetItem("앨범에서 선택", () async {
//           _onPicker();
//           await getImagePermission(imageSource: ImageSource.gallery);
//           if (_image != null) {
//             Navigator.of(context).pop();
//           }
//         }),
//         AppSpacers.height16,
//       ],
//     );
//   }

//   @override
//   onImagePermission(ImageSource imageSource) async {
//     // final pickedFile = await picker.getImage(source: imageSource, maxHeight: 1000, maxWidth: 1000, imageQuality: 70);
//     final pickedFile = await picker.pickImage(source: imageSource);

//     if (pickedFile == null) {
//       l.info(this, 'PhotoSelectorBottomSheet: No image selected.');
//       return;
//     }
//     File? file = await compressAndGetFile(pickedFile);

//     setState(() {
//       _image = File(file!.path);
//       widget.onPick!(_image);
//     });
//   }
// }
