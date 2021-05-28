import 'package:interview_review_app/data/model/userdata.dart';

abstract class HomeState {
  final UserData userData, userDataCopy;
  int count;

  HomeState(this.userData, this.count, this.userDataCopy);
}

class ListLoadingState extends HomeState {
  ListLoadingState() : super(UserData(), 0, UserData());
}

class ListLoadedState extends HomeState {
  ListLoadedState(UserData userData, count, userDataCopy)
      : super(userData, count, userDataCopy);
}

class UserAddedState extends HomeState {
  UserAddedState(userData, count, userDataCopy)
      : super(userData, count, userDataCopy);
}

class UserRemovedState extends HomeState {
  UserRemovedState(userData, count, userDataCopy)
      : super(userData, count, userDataCopy);
}

class SearchedState extends HomeState {
  SearchedState(userData, count, userDataCopy)
      : super(userData, count, userDataCopy);
}
