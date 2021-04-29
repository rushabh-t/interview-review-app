import 'package:interview_review_app/data/model/userdata.dart';

abstract class HomeState {
  final UserData userData;
  int count;

  HomeState(this.userData, this.count);
}

class ListLoadingState extends HomeState {
  ListLoadingState() : super(UserData(), 0);
}

class ListLoadedState extends HomeState {
  ListLoadedState(UserData userData, int count) : super(userData, count);
}

class UserAddedState extends ListLoadedState {
  UserAddedState(UserData userData, int count) : super(userData, count);
}

class UserRemovedState extends ListLoadedState {
  UserRemovedState(UserData userData, int count) : super(userData, count);
}
