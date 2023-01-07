part of 'bottom_sheet_cubit.dart';

class BottomSheetState extends Equatable {
  final bool isCategoryAddBarOpen;

  const BottomSheetState({
    this.isCategoryAddBarOpen = false,
  });

  @override
  List<Object> get props => [
        isCategoryAddBarOpen,
      ];

  BottomSheetState copyWith({
    bool? isCategoryAddBarOpen,
  }) {
    return BottomSheetState(
      isCategoryAddBarOpen: isCategoryAddBarOpen ?? this.isCategoryAddBarOpen,
    );
  }
}
