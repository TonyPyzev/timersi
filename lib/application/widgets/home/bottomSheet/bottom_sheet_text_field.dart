import 'package:flutter/material.dart';
import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/application/theme/font_theme.dart';

class BottomSheetTextField extends StatelessWidget {
  final String hintText;

  BottomSheetTextField({
    super.key,
    required this.hintText,
  });

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xFFE0E0E0),
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppPadings.kSmall,
          ),
        ),
      ),
      child: TextField(
        controller: _textController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppPadings.kDefault,
            horizontal: AppPadings.kMedium,
          ),
          hintText: hintText,
          hintStyle: FontTheme.bottomSheetInputHint,
          border: InputBorder.none,
        ),
        maxLines: 1,
        style: FontTheme.bottomSheetInput,
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
