import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key, required this.onChanged});
  final ValueChanged<File> onChanged;
  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
        );
        imageFile = File(image!.path);
        setState(() {});
        widget.onChanged(imageFile!);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(16),
            ),
            child:
                imageFile != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(imageFile!, fit: BoxFit.cover),
                    )
                    : Icon(Icons.image_outlined, size: 120),
          ),
          Visibility(
            visible: imageFile != null,
            child: IconButton(
              onPressed: () {
                setState(() {
                  imageFile = null;
                });
              },
              icon: Icon(Icons.cancel_rounded, color: AppColors.lightOrange),
            ),
          ),
        ],
      ),
    );
  }
}
