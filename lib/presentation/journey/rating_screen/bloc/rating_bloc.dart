import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_review_app/domain/entities/rating_card_entity.dart';
import 'package:interview_review_app/presentation/journey/rating_screen/bloc/rating_state.dart';
import 'package:interview_review_app/presentation/journey/rating_screen/bloc/rating_event.dart';
import 'package:interview_review_app/presentation/journey/rating_screen/widgets/rating_screen_constants.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  List<RatingCardEntity> ratingCard;

  RatingBloc() : super(RatingInitial());

  @override
  Stream<RatingState> mapEventToState(RatingEvent event) async* {
    switch (event.runtimeType) {
      case OnTapEvent:
        yield* _mapOnTapEventToState(event);
        break;
      case LoadRatingEvent:
        yield* _mapLoadRatingEventToState(event);
        break;
    }
  }

  Stream<RatingState> _mapOnTapEventToState(OnTapEvent event) async* {
    yield RatingLoaded(event.index, state.ratingCardEntityList);
    ratingCard = state.ratingCardEntityList;
    ratingCard.forEach((element) => element.isSelected = false);
    RatingCardEntity ratingCardEntity = ratingCard[event.index];
    ratingCardEntity.isSelected = true;
    yield RatingSelected(event.index, ratingCard);
  }

  Stream<RatingState> _mapLoadRatingEventToState(LoadRatingEvent event) async* {
    ratingCard = RatingScreenConstants.ratingCardEntityList;
    yield RatingLoaded(state.index, ratingCard);
  }
}
