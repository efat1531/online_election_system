import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oes/constants/color_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CandidateIconImage extends StatefulWidget {
  const CandidateIconImage({super.key, required this.onSelectImage});
  final void Function(XFile image) onSelectImage;

  @override
  State<CandidateIconImage> createState() => _CandidateIconImageState();
}

class _CandidateIconImageState extends State<CandidateIconImage> {
  File? _selectedSymbol;

  void _takeCandidateSymbol() async {
    final imagePicker = ImagePicker();
    final pickImaged = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickImaged == null) {
      return;
    }
    setState(() {
      _selectedSymbol = File(pickImaged.path);
    });
    widget.onSelectImage(pickImaged);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takeCandidateSymbol,
      icon: const Icon(
        Icons.image_outlined,
        color: kMainColor,
      ),
      label: Text(
        'Select Party Symbol',
        style: GoogleFonts.montserrat(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: k3B3B3B,
        ),
      ),
    );
    if (_selectedSymbol != null) {
      content = GestureDetector(
        onTap: _takeCandidateSymbol,
        child: Image.file(
          _selectedSymbol!,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      );
    }

    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: k1D4860,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      alignment: Alignment.center,
      child: content,
    );
  }
}
