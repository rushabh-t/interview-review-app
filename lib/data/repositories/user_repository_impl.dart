import 'package:interview_review_app/data/datasources/user_remote_data_source.dart';
import 'package:interview_review_app/data/model/userdata.dart';
import 'package:interview_review_app/domain/respositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl(this.userRemoteDataSource);

  @override
  Future<UserData> getUserData() => this.userRemoteDataSource.getUserData();
}
