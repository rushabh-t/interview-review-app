import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_review_app/data/model/results.dart';
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
      case SearchEvent:
        yield* _mapSearchEventToState(event);
        break;
    }
  }

  Stream<HomeState> _mapLoadListEventToState(LoadListEvent event) async* {
    final UserData userData = await userUsecase.getUserData();
    yield ListLoadedState(userData, 0, userData);
  }

  Stream<HomeState> _mapUserAddEventToState(UserAddEvent event) async* {
    int count = state.count;
    UserData data = state.userData;
    data.results[event.index].isAdded = true;
    count++;
    yield UserAddedState(data, count, data);
  }

  Stream<HomeState> _mapUserRemoveEventToState(UserRemoveEvent event) async* {
    int count = state.count;
    UserData data = state.userData;
    data.results[event.index].isAdded = false;
    count--;
    yield UserRemovedState(data, count, data);
  }

  Stream<HomeState> _mapSearchEventToState(SearchEvent event) async* {
    UserData dataCopy = state.userDataCopy;
    String query = event.query;
    List<Results> searchResults = [];

    if (query.isNotEmpty) {
      dataCopy.results.forEach((element) {
        if (element.fullName.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(element);
        }
      });
      yield SearchedState(
          UserData(results: searchResults), state.count, dataCopy);
    } else {
      yield ListLoadedState(dataCopy, state.count, dataCopy);
    }
  }
}
