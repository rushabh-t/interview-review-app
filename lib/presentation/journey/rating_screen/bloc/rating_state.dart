import 'package:interview_review_app/presentation/journey/rating_screen/rating_screen_constants.dart';

abstract class RatingState {
  int index;

  RatingScreenConstants ratingScreenConstants;

  RatingState(this.index, this.ratingScreenConstants);
}

class RatingInitial extends RatingState {
  RatingInitial() : super(0, RatingScreenConstants());
}

class RatingLoaded extends RatingState {
  RatingLoaded(int index, RatingScreenConstants ratingScreenConstants)
      : super(index, ratingScreenConstants);
}

class RatingSelected extends RatingState {
  RatingSelected(int index, RatingScreenConstants ratingScreenConstants)
      : super(index, ratingScreenConstants);
}
