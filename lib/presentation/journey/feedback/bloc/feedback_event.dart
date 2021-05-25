abstract class FeedbackEvent {}

class LoadChipEvent extends FeedbackEvent {}

class ChipTapEvent extends FeedbackEvent {
  int index;

  ChipTapEvent(this.index);
}
