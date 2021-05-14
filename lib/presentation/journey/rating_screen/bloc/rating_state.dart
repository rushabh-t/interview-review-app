import 'package:interview_review_app/domain/entities/rating_card_entity.dart';

abstract class RatingState {
  int index;
  List<RatingCardEntity> ratingCardEntityList;

  RatingState(
    this.index,
    this.ratingCardEntityList,
  );
}

class RatingInitial extends RatingState {
  RatingInitial() : super(0, []);
}

class RatingLoaded extends RatingState {
  RatingLoaded(int index, List<RatingCardEntity> ratingCardEntityList)
      : super(index, ratingCardEntityList);
}

class RatingSelected extends RatingState {
  RatingSelected(int index, List<RatingCardEntity> ratingCardEntityList)
      : super(index, ratingCardEntityList);
}
