abstract class RatingEvent {}

class LoadRatingEvent extends RatingEvent {}

class OnTapEvent extends RatingEvent {
  int index;

  OnTapEvent(this.index);
}
