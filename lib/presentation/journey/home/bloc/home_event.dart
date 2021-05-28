abstract class HomeEvent {}

class LoadListEvent extends HomeEvent {}

class UserAddEvent extends HomeEvent {
  int index;

  UserAddEvent(this.index);
}

class UserRemoveEvent extends HomeEvent {
  int index;

  UserRemoveEvent(this.index);
}

class SearchEvent extends HomeEvent {
  String query;

  SearchEvent(this.query);
}
