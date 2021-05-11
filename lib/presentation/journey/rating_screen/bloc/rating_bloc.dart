import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_review_app/domain/entities/rating_card_entity.dart';

import 'package:interview_review_app/presentation/journey/rating_screen/bloc/rating_state.dart';
import 'package:interview_review_app/presentation/journey/rating_screen/bloc/rating_event.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  List<RatingCardEntity> ratingCard;

  RatingBloc() : super(RatingInitial(0));

  @override
  Stream<RatingState> mapEventToState(RatingEvent event) async* {
    if (event is OnTapEvent) {
      yield* _mapOnTapEventToState(event);
    }
  }

  Stream<RatingState> _mapOnTapEventToState(OnTapEvent event) async* {
    state.ratingScreenConstants.ratingCardEntityList.forEach((element) {
      element.isSelected = false;
    });
    RatingCardEntity ratingCardEntity =
        state.ratingScreenConstants.ratingCardEntityList[event.index];
    ratingCardEntity.isSelected = true;
    yield RatingSelected(event.index, state.ratingScreenConstants);
  }
}
