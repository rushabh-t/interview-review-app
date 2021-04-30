import 'package:interview_review_app/data/model/userdata.dart';

abstract class UserRepository {
  Future<UserData> getUserData();
}
