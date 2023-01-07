import 'package:feather_icons_svg/feather_icons_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timersi/application/constants/app_colors.dart';
import 'package:timersi/application/constants/app_paddings.dart';
import 'package:timersi/application/screens/home/cubit/bottomSheet/bottom_sheet_cubit.dart';
import 'package:timersi/application/theme/font_theme.dart';

import 'bottom_sheet_text_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BottomSheetCubit>();

    return Wrap(
      children: [
        BlocBuilder<BottomSheetCubit, BottomSheetState>(
          builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(
                color: AppColors.kSoftWhite,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppPadings.kDefault),
                ),
              ),
              padding: const EdgeInsets.only(
                top: AppPadings.kMedium,
                right: AppPadings.kMedium,
                bottom: AppPadings.kLarge,
                left: AppPadings.kMedium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Add',
                      style: FontTheme.bottomSheetHeader,
                    ),
                  ),
                  const SizedBox(
                    height: AppPadings.kDefault,
                  ),
                  BottomSheetTextField(
                    hintText: 'Name',
                  ),
                  const SizedBox(height: AppPadings.kMedium),
                  Text(
                    'Category',
                    style: FontTheme.bottomSheetTitle,
                  ),
                  const SizedBox(height: AppPadings.kSmall),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 48,
                      minHeight: 48,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ListView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  //TODO select item
                                },
                                child: Container(
                                  height: 48,
                                  width: 48,
                                  constraints: BoxConstraints.loose(
                                    const Size(48, 48),
                                  ),
                                  margin: const EdgeInsets.only(
                                    right: AppPadings.kSmall,
                                  ),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFE8CF76),
                                        Color(0xFFFFC700)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        AppPadings.kSmall,
                                      ),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.fitness_center,
                                      color: AppColors.kSoftBlack,
                                      size: 36,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              cubit.switchCategoryAddBarState();
                            },
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE0E0E0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    AppPadings.kSmall,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: FeatherIcon(
                                  state.isCategoryAddBarOpen
                                      ? FeatherIcons.xCircle
                                      : FeatherIcons.plusCircle,
                                  color: const Color(0xFF8C8C8C),
                                  strokeWidth: 1,
                                  size: 36,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (state.isCategoryAddBarOpen)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppPadings.kSmall),
                        Text(
                          'Add category',
                          style: FontTheme.bottomSheetSubtitle,
                        ),
                        const SizedBox(height: AppPadings.kTiny),
                        BottomSheetTextField(
                          hintText: 'Category name',
                        ),
                        const SizedBox(height: AppPadings.kSmall),
                        Text(
                          'Category icon',
                          style: FontTheme.bottomSheetSubtitle,
                        ),
                        const SizedBox(height: AppPadings.kTiny),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 48,
                            minHeight: 48,
                          ),
                          child: ListView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  //TODO select item
                                },
                                child: Container(
                                  height: 48,
                                  width: 48,
                                  constraints: BoxConstraints.loose(
                                    const Size(48, 48),
                                  ),
                                  margin: const EdgeInsets.only(
                                    right: AppPadings.kSmall,
                                  ),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFE8CF76),
                                        Color(0xFFFFC700)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        AppPadings.kSmall,
                                      ),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.fitness_center,
                                      color: AppColors.kSoftBlack,
                                      size: 36,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: AppPadings.kBig),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            cubit.resetState();
                          },
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColors.kSoftWhite,
                              border: Border.all(
                                color: AppColors.kSoftBlack,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(
                                AppPadings.kMedium,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Close',
                                style: TextStyle(
                                  color: AppColors.kSoftBlack,
                                  fontSize: 20,
                                  fontFamily: 'Lora',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppPadings.kMedium),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            //TODO Save created timer
                          },
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColors.kSoftBlack,
                              borderRadius: BorderRadius.circular(
                                AppPadings.kMedium,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: AppColors.kSoftWhite,
                                  fontSize: 20,
                                  fontFamily: 'Lora',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
