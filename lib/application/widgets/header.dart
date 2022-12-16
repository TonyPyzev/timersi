import 'package:flutter/material.dart';

import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/application/theme/font_theme.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomLeft,
      width: double.infinity,
      height: size.height * 0.2,
      constraints: const BoxConstraints(
        minHeight: 102,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppPadings.kMedium,
            bottom: AppPadings.kDefault,
          ),
          child: Text(
            title,
            style: FontTheme.header,
          ),
        ),
      ),
    );
  }
}
