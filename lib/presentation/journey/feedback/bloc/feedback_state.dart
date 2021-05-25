import 'package:interview_review_app/domain/entities/chip_entity.dart';

abstract class FeedbackState {
  int index;
  List<ChipEntity> chipList;

  FeedbackState(this.index, this.chipList);
}

class FeedbackInitial extends FeedbackState {
  FeedbackInitial() : super(0, []);
}

class ChipLoaded extends FeedbackState {
  ChipLoaded(int index, List<ChipEntity> chipList) : super(index, chipList);
}

class ChipSelected extends FeedbackState {
  ChipSelected(int index, List<ChipEntity> chipList) : super(index, chipList);
}
