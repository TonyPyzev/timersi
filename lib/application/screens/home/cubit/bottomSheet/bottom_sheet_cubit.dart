import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_sheet_state.dart';

class BottomSheetCubit extends Cubit<BottomSheetState> {
  BottomSheetCubit() : super(const BottomSheetState());

  void switchCategoryAddBarState() {
    emit(state.copyWith(isCategoryAddBarOpen: !state.isCategoryAddBarOpen));
  }

  void resetState() {
    emit(const BottomSheetState());
  }
}
