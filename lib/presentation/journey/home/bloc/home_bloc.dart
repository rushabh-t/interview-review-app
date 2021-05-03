import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_review_app/data/model/userdata.dart';
import 'package:interview_review_app/domain/usecases/user_usecase.dart';
import 'package:interview_review_app/presentation/journey/home/bloc/home_event.dart';
import 'package:interview_review_app/presentation/journey/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  UserUsecase userUsecase;

  HomeBloc(this.userUsecase) : super(ListLoadingState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    switch (event.runtimeType) {
      case LoadListEvent:
        yield* _mapLoadListEventToState(event);
        break;
      case UserAddEvent:
        yield* _mapUserAddEventToState(event);
        break;
      case UserRemoveEvent:
        yield* _mapUserRemoveEventToState(event);
        break;
    }
  }

  Stream<HomeState> _mapLoadListEventToState(LoadListEvent event) async* {
    yield ListLoadingState();
    final UserData userData = await userUsecase.getUserData();
    yield ListLoadedState(userData, 0);
  }

  Stream<HomeState> _mapUserAddEventToState(UserAddEvent event) async* {
    event.count++;
    state.userData.results[event.index].isAdded = true;
    yield UserAddedState(state.userData, event.count);
  }

  Stream<HomeState> _mapUserRemoveEventToState(UserRemoveEvent event) async* {
    event.count--;
    state.userData.results[event.index].isAdded = false;
    yield UserRemovedState(state.userData, event.count);
  }
}
