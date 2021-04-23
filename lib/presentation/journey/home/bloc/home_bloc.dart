import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_review_app/data/model/userdata.dart';
import 'package:interview_review_app/domain/usecases/user_usecase.dart';
import 'package:interview_review_app/presentation/journey/home/bloc/home_event.dart';
import 'package:interview_review_app/presentation/journey/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  UserUsecase userUsecase;

  HomeBloc() : super(ListLoadingState()) {
    this.userUsecase = UserUsecase();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadListEvent) {
      yield* _mapLoadListEventToState(event);
    }
  }

  Stream<HomeState> _mapLoadListEventToState(LoadListEvent event) async* {
    yield ListLoadingState();
    final UserData userData = await userUsecase.getUserData();
    yield ListLoadedState(userData);
  }
}
