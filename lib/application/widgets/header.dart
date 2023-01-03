import 'package:flutter/material.dart';

import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/application/theme/font_theme.dart';

class Header extends StatelessWidget {
  final String title;
  final Widget? leading;

  const Header({
    super.key,
    required this.title,
    this.leading,
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
          padding: EdgeInsets.only(
            left: leading != null ? AppPadings.kBig : AppPadings.kMedium,
            right: AppPadings.kLarge,
            bottom: AppPadings.kDefault,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (leading != null) leading!,
              Text(
                title,
                style: FontTheme.header.copyWith(
                  fontWeight:
                      leading != null ? FontWeight.w400 : FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
