import 'package:interview_review_app/data/model/userdata.dart';
//import 'package:interview_review_app/data/repositories/user_repository_impl.dart';
import 'package:interview_review_app/domain/respositories/user_repository.dart';

class UserUsecase {
  UserRepository _userRepository;

  UserUsecase(this._userRepository);

  Future<UserData> getUserData() => _userRepository.getUserData();
}
