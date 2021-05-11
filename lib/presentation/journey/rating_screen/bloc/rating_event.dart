abstract class RatingEvent {}

class OnTapEvent extends RatingEvent {
  int index;

  OnTapEvent(this.index);
}
