import 'package:interview_review_app/data/model/userdata.dart';
import 'package:interview_review_app/network/api/api_client.dart';
import 'package:interview_review_app/network/api/api_client_endpoint.dart';

class UserRemoteDataSource {
  ApiClient _client;

  UserRemoteDataSource(this._client);

  Future<UserData> getUserData({int count = 50}) async {
    Map<String, dynamic> jsonData =
        await _client.get('${ApiEndPoint.randomUserList}$count');
    return UserData.fromJson(jsonData);
  }
}
