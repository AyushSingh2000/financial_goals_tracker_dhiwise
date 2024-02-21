import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../colors.dart';

class ImgPicker extends StatefulWidget {
  const ImgPicker({Key? key}) : super(key: key);

  @override
  State<ImgPicker> createState() => _ImgPickerState();
}

class _ImgPickerState extends State<ImgPicker> {
  late File _image;

  @override
  void initState() {
    super.initState();
    _image = File(''); // Initialize with an empty file or a default image.
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Pallete.txt2color,
        backgroundImage: _image.existsSync() ? FileImage(_image) : null,
        child: _image.existsSync()
            ? null
            : const Icon(
                Icons.camera_alt_rounded,
                size: 50,
              ),
      ),
    );
  }
}
