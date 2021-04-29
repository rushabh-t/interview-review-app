abstract class HomeEvent {}

class LoadListEvent extends HomeEvent {}

class UserAddEvent extends HomeEvent {
  int count;

  UserAddEvent(this.count);
}

class UserRemoveEvent extends HomeEvent {
  int count;

  UserRemoveEvent(this.count);
}
