import 'package:interview_review_app/data/model/userdata.dart';

abstract class HomeState {}

class ListLoadingState extends HomeState {}

class ListLoadedState extends HomeState {
  final UserData userData;

  ListLoadedState(this.userData);
}
