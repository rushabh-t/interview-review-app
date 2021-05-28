import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_review_app/domain/entities/chip_entity.dart';
import 'package:interview_review_app/presentation/journey/feedback/bloc/feedback_event.dart';
import 'package:interview_review_app/presentation/journey/feedback/bloc/feedback_state.dart';
import 'package:interview_review_app/presentation/journey/feedback/widgets/feedback_screen/feedback_screen_constants.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  List<ChipEntity> chipList;

  FeedbackBloc() : super(FeedbackInitial());

  @override
  Stream<FeedbackState> mapEventToState(FeedbackEvent event) async* {
    switch (event.runtimeType) {
      case LoadChipEvent:
        yield* _mapLoadChipEventToState(event);
        break;
      case ChipTapEvent:
        yield* _mapChipTapEventToState(event);
        break;
    }
  }

  Stream<FeedbackState> _mapLoadChipEventToState(LoadChipEvent event) async* {
    chipList = FeedbackScreenConstants.chipList;
    chipList.forEach((element) => element.selected = false);
    yield ChipLoaded(state.index, chipList);
  }

  Stream<FeedbackState> _mapChipTapEventToState(ChipTapEvent event) async* {
    yield ChipLoaded(event.index, state.chipList);
    chipList = state.chipList;
    ChipEntity chipEntity = chipList[event.index];
    chipEntity.selected = true;
    yield ChipSelected(event.index, chipList);
  }
}
