import 'package:flutter/material.dart';
import 'package:timersi/application/constants/app_colors.dart';
import 'package:timersi/application/constants/app_paddings.dart';

class InfoTextBox extends StatelessWidget {
  final String leading;
  final String trail;

  const InfoTextBox({
    super.key,
    required this.leading,
    required this.trail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: AppPadings.kSmall,
        left: AppPadings.kMedium,
        right: AppPadings.kMedium,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: AppPadings.kMedium,
      ),
      decoration: const BoxDecoration(
        color: AppColors.kSoftBlack,
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppPadings.kDefault,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
          Text(
            trail,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
