import 'package:interview_review_app/data/datasources/user_local_data_source.dart';
import 'package:interview_review_app/data/datasources/user_remote_data_source.dart';
import 'package:interview_review_app/data/model/userdata.dart';
import 'package:interview_review_app/domain/respositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRemoteDataSource userRemoteDataSource;
  UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl(this.userRemoteDataSource, this.userLocalDataSource);

  @override
  Future<UserData> getUserData({int count = 50}) async {
    int userCount = await userLocalDataSource.getCount();
    if (userCount > 0) {
      return userLocalDataSource.getUser();
    }
    UserData userData = await userRemoteDataSource.getUserData(count: count);

    await userLocalDataSource.saveUser(userData);
    return userData;
  }
}
