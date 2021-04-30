abstract class HomeEvent {}

class LoadListEvent extends HomeEvent {}

class UserAddEvent extends HomeEvent {
  int count, index;

  UserAddEvent(this.count, this.index);
}

class UserRemoveEvent extends HomeEvent {
  int count, index;

  UserRemoveEvent(this.count, this.index);
}
