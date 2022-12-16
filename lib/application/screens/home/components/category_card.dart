import 'package:feather_icons_svg/feather_icons_svg.dart';
import 'package:flutter/material.dart';

import 'package:timersi/application/constants/app_colors.dart';
import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/data/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final LinearGradient gradient;
  final Color iconColor;

  const CategoryCard({
    super.key,
    required this.category,
    required this.gradient,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadings.kMedium,
        right: AppPadings.kMedium,
        bottom: AppPadings.kSmall,
      ),
      child: GestureDetector(
        onTap: () {
          //TODO open timer
        },
        child: Container(
          width: double.infinity,
          height: 84,
          constraints: const BoxConstraints(
            minWidth: 300,
            maxWidth: 450,
          ),
          decoration: BoxDecoration(
            color: AppColors.kSoftBlack,
            borderRadius: BorderRadius.circular(
              AppPadings.kDefault,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              AppPadings.kDefault,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: BorderRadius.circular(
                          AppPadings.kSmall,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          category.icon,
                          size: 36,
                          color: iconColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppPadings.kDefault,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style: const TextStyle(
                            color: AppColors.kSoftWhite,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          '7 events',
                          style: TextStyle(
                            color: AppColors.kSoftWhite,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const FeatherIcon(
                  FeatherIcons.arrowRightCircle,
                  color: AppColors.kSoftWhite,
                  strokeWidth: 0.75,
                  size: 36,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
