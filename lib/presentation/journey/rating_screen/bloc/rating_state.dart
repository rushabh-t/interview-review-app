import 'package:interview_review_app/presentation/journey/rating_screen/rating_screen_constants.dart';

abstract class RatingState {
  int index;
  RatingScreenConstants ratingScreenConstants;

  RatingState(this.index, this.ratingScreenConstants);
}

class RatingInitial extends RatingState {
  RatingInitial(int index) : super(index, RatingScreenConstants());
}

class RatingSelected extends RatingState {
  RatingSelected(int index, RatingScreenConstants ratingScreenConstants)
      : super(index, ratingScreenConstants);
}
