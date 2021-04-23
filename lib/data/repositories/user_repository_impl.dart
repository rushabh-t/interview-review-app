import 'package:interview_review_app/data/datasources/remote_data_source.dart';
import 'package:interview_review_app/data/model/userdata.dart';
import 'package:interview_review_app/domain/respositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  RemoteDataSource remoteDataSource;

  UserRepositoryImpl() {
    this.remoteDataSource = RemoteDataSource();
  }

  @override
  Future<UserData> getUserData() => this.remoteDataSource.getUserData();
}
